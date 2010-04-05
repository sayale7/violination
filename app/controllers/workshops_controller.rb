class WorkshopsController < ApplicationController
  
  def show
    if params[:id]
      user = User.find(params[:id])
      @the_instance = user.workshop
    else
      @the_instance = current_user.workshop
    end
    @added_tags =  @the_instance.tags.find_all_by_parent_id(nil, 'Workshop')
    @photo = Photo.new
    @photos = Photo.find_all_by_photo_container_id_and_thumbnail(@the_instance.id, nil)
  end
  
  def edit
    if params[:id]
      user = User.find(params[:id])
      @the_instance = user.workshop
    else
      @the_instance = current_user.workshop
    end
    @added_tags =  @the_instance.tags.find_all_by_parent_id(nil, 'Workshop')
    @available_tags =  Tag.find_all_by_parent_id_and_taggable_type(nil, 'Workshop') - @added_tags
    @tag = Tag.find_by_taggable_type_and_parent_id(@the_instance.class.to_s, nil)
    @photo = Photo.new
    @photos = Photo.find_all_by_photo_container_id_and_thumbnail(@the_instance.id, nil)
  end
  
  def update
    @the_instance = Workshop.find(params[:format])
    @the_instance.update_attribute(:description, params[:description])
    redirect_to "/workshop/edit.#{@the_instance.id}"
  end


  def edit_workshop_taggings
    if params[:id]
      @the_instance = Workshop.find(params[:id])
    else
      @the_instance = current_user.workshop
    end
    @level = 0
    if params[:parent_id]
      @tags = Tag.find_all_by_taggable_type_and_parent_id('Workshop', params[:parent_id]) - @the_instance.tags
      @tag = Tag.find_by_taggable_type_and_parent_id('Workshop', params[:parent_id])
    else
      @tags = Tag.find_all_by_taggable_type_and_parent_id('Workshop', nil) - @the_instance.tags
      @tag = Tag.find_by_taggable_type_and_parent_id('Workshop', nil)
    end
  end
  
  
end