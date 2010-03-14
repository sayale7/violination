class TaggingsController < ApplicationController

  def create
    @user = User.find(params[:taggable_id])
    tagging = Tagging.new
    tagging.taggable_type = params[:taggable_type]
    tagging.tag_id = params[:tag]
    tagging.taggable_id = params[:taggable_id]
    @level = params[:level]
    @tag = Tag.find(tagging.tag_id)
    if @tag.parent_id.nil?
      parent_id = ''
    else
      parent_id = '?parent_id='+@tag.parent_id.to_s
    end
    if tagging.save
      respond_to do |format|
        format.html { redirect_to '/edit_' + params[:taggable_type].to_s.downcase + '_taggings' + parent_id }
        format.js { render '/taggings/base.js.erb' }
      end
    else
      respond_to do |format|
        format.html { redirect_to '/edit_' + params[:taggable_type].to_s.downcase + '_taggings' + parent_id.to_s }
        format.js { render '/taggings/base.js.erb' }
      end
    end
  end
  
  def destroy
    @user = User.find(params[:taggable_id])
    @level = params[:level]
    tagging = Tagging.find_by_taggable_type_and_taggable_id_and_tag_id(params[:taggable_type], params[:taggable_id], params[:tag])
    @tag = Tag.find(tagging.tag_id)
    if @tag.parent_id.nil?
      parent_id = ''
    else
      parent_id = '?parent_id='+@tag.parent_id.to_s
    end
    tagging.destroy
    respond_to do |format|
      format.html { redirect_to '/edit_' + params[:taggable_type].to_s.downcase + '_taggings' + parent_id.to_s }
      format.js { render '/taggings/base.js.erb' }
    end
  end
end