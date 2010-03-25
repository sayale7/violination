class WorkshopsController < ApplicationController
  
  def show
    @the_instance = current_user.workshop
    @added_tags =  @the_instance.tags.find_all_by_parent_id(nil, 'Workshop')
    @available_tags =  Tag.find_all_by_parent_id_and_taggable_type(nil, 'Workshop') - @added_tags
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