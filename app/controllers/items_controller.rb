class ItemsController < ApplicationController
  
  def index
    if params[:user_id]
      @the_instance = get_taggable_type(params[:taggable_type].to_s).find_all_by_user_id(params[:user_id])
    end
    if !params[:user_id]
      @the_instance = get_taggable_type(params[:taggable_type].to_s).all
    end
    render :template  => '/items/index.haml'
  end
  
  def show
    if params[:id]
      @the_instance = get_taggable_type(params[:taggable_type].to_s).find(params[:id])
    end
    @added_tags =  @the_instance.tags.find_all_by_parent_id(nil)
    @available_tags = Tag.find_all_by_taggable_type_and_parent_id(@the_instance.item_type.to_s, nil) - @added_tags
    @photo = Photo.new
    @photos = Photo.find_all_by_photo_container_id_and_thumbnail(@the_instance.id, nil)
    render :action => 'show', :template  => '/items/show.haml'
  end
  
  def new
    @the_instance = Item.new
    @the_instance.user_id = current_user.id
    @the_instance.item_type = params[:taggable_type].to_s
    if @the_instance.save
      redirect_to "/#{params[:taggable_type].to_s.downcase.pluralize}/#{@the_instance.id}?taggable_type=#{params[:taggable_type].to_s}"
    end
  end
  
  def update
    @the_instance = get_taggable_type(params[:taggable_type].to_s).find(params[:id])
    if @the_instance.update_attributes(params[:instrument])
      redirect_to @the_instance
    else
      render :action => 'edit'
    end
  end
  
  def destroy
    @the_instance = get_taggable_type(params[:taggable_type].to_s).find(params[:id])
    @the_instance.destroy
    redirect_to "/#{params[:taggable_type].to_s.downcase.pluralize}?user_id=#{current_user.id}&taggable_type=#{params[:taggable_type].to_s}"
  end
  
  private
  
  def get_tag_for_instrument_kind(tag_name)
    ids = Array.new
    TagName.find_all_by_value(tag_name).each do |name|
      ids.push(name.tag_id)
    end
    return Tag.find_by_parent_id_and_id(nil, ids.uniq)
  end
  
  def root_tag(instrument_kind)
    Tag.find_all_by_parent_id_and_taggable_type(nil, 'Instrument').each do |tag|
      if tag.id == instrument_kind
        @tag = tag
      end
    end
  end
  
  def get_taggable_type(type)
    the_class = Kernel.const_get(type)
    if the_class.superclass.to_s.eql?('Item')
      the_class = Kernel.const_get('Item')
    end
    return the_class
  end
    # 
    # def edit_instrument_taggings
    #   unless @the_instance
    #     @the_instance = Instrument.find(params[:instance])
    #   end
    #   @level = 0
    #   if params[:parent_id]
    #     @tags = Tag.find_all_by_taggable_type_and_parent_id('Instrument', params[:parent_id]) - @the_instance.tags
    #     @tag = Tag.find_by_taggable_type_and_parent_id('Instrument', params[:parent_id])
    #   else
    #     @tags = Tag.find_all_by_taggable_type_and_parent_id('Instrument', nil) - @the_instance.tags
    #     @tag = Tag.find_by_taggable_type_and_parent_id('Instrument', nil)
    #   end
    # end
    # 
    # def edit_inner_instrument_taggings
    #   @the_instance = current_user
    #   @level = params[:level]
    #   @tags = Tag.find_all_by_taggable_type_and_id('User', params[:parent_id]) - @the_instance.tags
    #   @tag = Tag.find_by_taggable_type_and_id('User', params[:parent_id])
    #   respond_to do |format|
    #     format.js { render '/users/edit_inner_user_taggings.js.erb' }
    #   end
    # end
  
end