class SearchController < ApplicationController

  def init
    @tag_values = Array.new
    @tag_names = Array.new
  end
  
  def search_user
    init
    the_users = Array.new
    
    if params[:search_input].empty? || params[:search_input].to_s.eql?(' ')
      @users = User.all
    else
      #split up the user input
      @search_words = params[:search_input].split
      
      #get the users from user attr
      the_users_from_attr = Array.new
      @search_words.each do |word|
        users = User.firstname_like_or_lastname_like(word)
        unless users.empty?
          users.each do |user|
            the_users_from_attr.push(user)
          end
        end
      end
      
      #get all search words that match a user tag (tag_name or tag_value)
      @user_search_words = get_search_words('User')
      
      #take the itemsearchwords away from the searchwords
      @search_words = @search_words - @user_search_words
      
      unless @user_search_words.empty?
        @user_search_words.each do |word|
          if the_users.empty?
            the_users = find_items(word, 'User')
          else
            the_users = the_users & find_items(word, 'User')
          end
        end
      end
      
      #get all search words that match a user tag (tag_name or tag_value) and match all without the item tags
      unless @search_words.empty?
        @workshop_search_words = get_search_words('Workshop') & @search_words
        @workshop_search_words = @workshop_search_words.uniq
        @search_words = @search_words.uniq - @workshop_search_words.uniq
        
        #search the user with the matching words
        @workshop_search_words.each do |word|
          users = Array.new
          workshops = find_items(word, 'Workshop')
          workshops.each do |workshop|
            users.push(workshop.user)
          end
          if the_users.empty?
            the_users = users
          else
            the_users = the_users & users
          end
        end
      end
      
      unless @search_words.empty?
        @users = nil
      else
        @users = the_users
      end
      
      unless @users.nil?
        @users = @users + the_users_from_attr
      else
        @users = the_users_from_attr
      end
      @users = @users.uniq
      
    end
    
    session[:search_input] = params[:search_input]
    @search_input = params[:search_input]
    respond_to do |format|
      format.html {render :template => '/users/index.haml'}
      format.js { render '/users/index.js.erb' }
    end
    
  end

  def search_item
    init
    the_items = Array.new

    if params[:search_input].empty? || params[:search_input].to_s.eql?(' ')
      unless params[:user_id].to_s.eql?('')
        @the_instances = Item.find_all_by_item_type_and_user_id(params[:taggable_type].to_s, params[:user_id])
        @user_id = params[:user_id]
      else
        @the_instances = Item.find_all_by_item_type(params[:taggable_type].to_s)
      end
    else
      #split up the user input
      @search_words = params[:search_input].split
      
      #get all search words that match a item tag (tag_name or tag_value)
      @item_search_words = get_search_words(params[:taggable_type].to_s)
      
      #take the itemsearchwords away from the searchwords
      @search_words = @search_words - @item_search_words 
      
      #search the items with the matching words
      @item_search_words.each_with_index do |word|
        if the_items.empty? and word.last.to_s.eql?('0')
          the_items = find_items(word.first, 'Item')
        else
          the_items = the_items & find_items(word.first, 'Item')
        end
      end
    
      #get all search words that match a user tag (tag_name or tag_value) and match all without the item tags
      unless @search_words.empty?
        @user_search_words = get_search_words('User') & @search_words
        @user_search_words = @user_search_words.uniq
        @search_words = @search_words.uniq - @user_search_words.uniq
        
        #search the user with the matching words
        @user_search_words.each do |word|
          items = Array.new
          users = find_items(word, 'User')
          users.each do |user|
            user.items.find_all_by_item_type(params[:taggable_type].to_s).each do |item|
              items.push(item)
            end
          end
          if the_items.empty?
            the_items = items
          else
            debugger
            the_items = the_items & items
          end
        end
      end
      
      unless @search_words.empty?
        @the_instances = nil
      else
        unless params[:user_id].to_s.eql?('')
          @the_instances = Item.find_all_by_id_and_item_type_and_user_id_and_contact(the_items, params[:taggable_type].to_s, params[:user_id], true)
          @user_id = params[:user_id]
        else
          @the_instances = Item.find_all_by_id_and_item_type(the_items, params[:taggable_type].to_s)
        end
      end
      
    end
    
    @search_input = params[:search_input]
    @taggable_type = params[:taggable_type].to_s
    session[:search_input] = params[:search_input]

    respond_to do |format|
      format.html {render :template  =>  '/items/index.haml'}
      format.js { render '/items/index.js.erb' }
    end
  end
  
  private
  
  def find_items(word, type)
    items = Array.new
    @tag_names.each do |tag_name|
      if tag_name.value.to_s.downcase.include?(word.to_s.downcase)
        Tagging.find_all_by_tag_id_and_taggable_type(tag_name.tag_id, type.to_s).each do |tagging|
          if the_class(type).exists?(tagging.taggable_id)
            items.push(the_class(type).find(tagging.taggable_id))
          end
        end
      end
    end
    @tag_values.each do |tag_value|
      TagValue.value_like(word.to_s).each do |tmp_tag_value|
        if tmp_tag_value.id.to_s.eql?(tag_value.id.to_s)
          if the_class(type).exists?(tag_value.taggable_id)
            items.push(the_class(type).find(tag_value.taggable_id))
          end
        end
      end
    end
    return items.uniq
  end
  
  def get_search_words(type)
    searchwords = Array.new
    tags = Array.new
    tags = Tag.find_all_by_taggable_type_and_searchable(type, true)
    
    tags.each do |tag|
      @search_words.uniq.each do |word|
        #find all tag_values matching the specified word
        nil_tags = Array.new
        nil_tags = TagValue.find_all_by_tag_id_and_value(tag.id, nil) unless nil?
        #only match with tag_values thats value not nil
        (TagValue.find_all_by_tag_id(tag.id) - nil_tags).each do |tag_value|
          TagValue.value_like(word.to_s).each do |tmp_tag_value|
            if tmp_tag_value.id.to_s.eql?(tag_value.id.to_s)
              searchwords.push(word)
              @tag_values.push(tag_value)
            end
          end
        end
        if !tag.german_name.nil? and !tag.parent_id.nil? and tag.german_name.to_s.downcase.include?(word.to_s.downcase)
          searchwords.push(word)
          @tag_names.push(TagName.find_by_language_and_tag_id('de', tag.id))
        end
        if !tag.english_name.nil? and !tag.parent_id.nil? and tag.english_name.to_s.downcase.include?(word.to_s.downcase)
          searchwords.push(word)
          @tag_names.push(TagName.find_by_language_and_tag_id('en', tag.id))
        end
      end
    end
    return searchwords.uniq
  end
  
  def the_class(type)
    the_class = Kernel.const_get(type)
    if the_class.superclass.to_s.eql?('Item') && superclass
      the_class = Kernel.const_get('Item')
    end
    return the_class
  end
  
  
end

