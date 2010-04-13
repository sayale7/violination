class SearchController < ApplicationController

  def search_user
    user_search
    @search_input = params[:search_input]
    respond_to do |format|
      format.html {render :template => '/users/index.haml'}
      format.js { render '/users/index.js.erb' }
    end
    
  end

  def search_item
    the_items = Array.new

    unless params[:search_input].empty? || params[:search_input].to_s.eql?(' ')

    
      all_item_and_user_values
      
      unless (@item_search_words.size + @user_search_words.size) == params[:search_input].split.size
        @item_search_words.uniq.each_with_index do |word|
          tmp_items_array = Array.new
          if !the_items.empty? && word.last > 0
            the_items.each do |item|
              the_compare_items = (search_by_tag_value(word.first, 'Item') + search_by_tag_name(word.first, 'Item')).uniq
              the_compare_items.each do |tmp_item|
                unless tmp_item.nil? || item.nil?
                  if tmp_item.id.to_s.eql?(item.id.to_s)
                    tmp_items_array.push(tmp_item)
                  end
                end
              end
            end
            the_items = tmp_items_array
          else
            the_items = the_items + search_by_tag_value(word.first, 'Item') + search_by_tag_name(word.first, 'Item')
          end
        end

        #todo user search implementierung

        the_items_ids = Array.new

        @items = the_items.uniq
        the_items.each do |item|
          unless item.nil?
            the_items_ids.push(item.id)
          end
        end
        @the_instances = Item.find_all_by_id_and_item_type(the_items_ids, params[:taggable_type].to_s)
      else
        @the_instances = Array.new
      end
    else
      @the_instances = Item.find_all_by_item_type(params[:taggable_type].to_s)
    end

    @search_input = params[:search_input]
    @taggable_type = params[:taggable_type].to_s

    respond_to do |format|
      format.html {render :template  =>  '/items/index.haml'}
      format.js { render '/items/index.js.erb' }
    end

  end

  private 
  
  def search_by_tag_value(word, type)
    items = Array.new
    TagValue.value_like(word).each do |tag_value|
      if tag_value.taggable_type.to_s.eql?(type.to_s)
        items.push(the_class(type).find_by_id_and_item_type(tag_value.taggable_id, params[:taggable_type].to_s))
      end
    end
    return items
  end
  
  def search_by_tag_name(word, type)
    items = Array.new
    TagName.value_like(word.to_s).each do |tag_name|
      Tagging.find_all_by_tag_id(tag_name.tag_id).each do |the_tagging|
        if the_tagging.taggable_type.to_s.eql?(type.to_s)
          items.push(the_class(type).find_by_id_and_item_type(the_tagging.taggable_id, params[:taggable_type].to_s))
        end
      end
    end
    return items
  end
  
  def all_item_and_user_values

    # items_through_tag_name = Array.new
    #     items_through_tag_value = Array.new
    # 
    #     users_through_tag_name = Array.new
    #     users_through_tag_value = Array.new
    @item_search_words = Array.new
    @user_search_words = Array.new
    
    params[:search_input].split.each do |search_param|

      #search every tagvalue for a user attribute
      TagValue.value_like(search_param).each do |tag_value|
        if tag_value.taggable_type.to_s.eql?('Item')
          @item_search_words.push(search_param)
        else 
          if tag_value.taggable_type.to_s.eql?('User')
            @user_search_words.push(search_param)
          end
        end
      end

      #search every tagvame for a user attribute
      TagName.value_like(search_param).each do |tag_name|
        Tagging.find_all_by_tag_id(tag_name.tag_id).each do |the_tagging|
          if the_tagging.taggable_type.to_s.eql?('Item')
            @item_search_words.push(search_param)
          else
            if the_tagging.taggable_type.to_s.eql?('User')
              @user_search_words.push(search_param)
            end
          end
        end
      end
      

    end
    
    # if items_through_tag_name.empty? && !items_through_tag_value.empty?
    #   @item_ids = items_through_tag_value.uniq
    # end
    # if items_through_tag_value.empty? && !items_through_tag_name.empty?
    #   @item_ids = items_through_tag_name.uniq
    # end
    # if !items_through_tag_value.empty? && !items_through_tag_name.empty?
    #   @item_ids = (items_through_tag_name.uniq & items_through_tag_value.uniq)
    # end
    # 
    # if !items_through_tag_value.empty? && !items_through_tag_name.empty?
    #   @item_ids = []
    # end
     
    #@user_ids = (users_through_tag_name.uniq & users_through_tag_value.uniq)
    
  end

  def user_search
    the_users = Array.new
    from_user = Array.new

    #if search form is empty  => fetch all users from db
    unless params[:search_input].empty?

      #split the userinput to perfom a detailed search
      params[:search_input].split.each do |search_param|

        users_through_tag_name = Array.new
        users_through_tag_value = Array.new

        #search every tagvalue for a user attribute
        TagValue.value_like(search_param).each do |tag_value|
          if tag_value.taggable_type.to_s.eql?('User')
            User.find_all_by_id(tag_value.taggable_id).each do |user|
              users_through_tag_value.push(user.id)
            end
          end
        end

        #search every tagvame for a user attribute
        TagName.value_like(search_param).each do |tag_name|
          Tagging.find_all_by_tag_id(tag_name.tag_id).each do |the_tagging|
            if Tag.find(the_tagging.tag_id).taggable_type.to_s.eql?('User')
              users_through_tag_name.push(User.find(the_tagging.taggable_id).id)
            end
          end

        end

        #search entries from tags and tag_values
        the_users = the_users + users_through_tag_name + users_through_tag_value
        #search entries from user search
        from_user = from_user + User.username_or_firstname_or_lastname_or_email_like(search_param)

      end

      @users = from_user 
      if @users.empty?
        @users = @users + User.find_all_by_id(get_users_from_workshops)
        if @users.empty?
          @users = @users + User.find_all_by_id(the_users)
        end
      end
      @users = @users.uniq

    else
      @users = User.username_or_firstname_or_lastname_or_email_like(params[:search_input])
    end

  end
  
  
  
  
  
  
  def user_search_from_taggables
    the_users = Array.new
    users_through_tag_name = Array.new
    users_through_tag_value = Array.new
    params[:search_input].split.each do |search_param|

      TagValue.value_like(search_param).each do |tag_value|
        User.find_all_by_id(tag_value.taggable_id).each do |user|
          tag = Tag.find(tag_value.tag.id)
          if tag.taggable_type.to_s.eql?('User')
            unless Tagging.find_by_tag_id_and_taggable_id(tag.id, user.id).nil?
              users_through_tag_value.push(user.id)
            end
          end
        end
      end

      TagName.value_like(search_param).each do |tag_name|
        Tagging.find_all_by_tag_id(tag_name.tag_id).each do |the_tagging|
          if (the_tagging.taggable_type.to_s.eql?('User')) 
            users_through_tag_name.push(User.find(the_tagging.taggable_id).id)
          end
        end

      end

      the_users = users_through_tag_name + users_through_tag_value
      the_users = the_users.uniq
    end

    @users = User.find_all_by_id(the_users)

  end


  def get_users_from_workshops
    the_users = Array.new
    from_user = Array.new

    #split the userinput to perfom a detailed search
    params[:search_input].split.each do |search_param|

      users_through_tag_name = Array.new
      users_through_tag_value = Array.new

      #search every tagvalue for a user attribute
      TagValue.value_like(search_param).each do |tag_value|
        if tag_value.taggable_type.to_s.eql?('Workshop')
          Workshop.find_all_by_id(tag_value.taggable_id).each do |workshop|
            users_through_tag_value.push(User.find(workshop.user_id).id)
          end
        end
      end

      #search every tagvame for a user attribute
      TagName.value_like(search_param).each do |tag_name|
        Tagging.find_all_by_tag_id(tag_name.tag_id).each do |the_tagging|
          if Tag.find(the_tagging.tag_id).taggable_type.to_s.eql?('Workshop')
            users_through_tag_name.push(User.find(Workshop.find(the_tagging.taggable_id).user_id).id)
          end
        end

      end

      #search entries from tags and tag_values
      the_users = the_users + users_through_tag_name + users_through_tag_value

    end
    
    return the_users
 
  end
  
  def the_class(type)
    the_class = Kernel.const_get(type)
    if the_class.superclass.to_s.eql?('Item')
      the_class = Kernel.const_get('Item')
    end
    return the_class
  end
  
end
