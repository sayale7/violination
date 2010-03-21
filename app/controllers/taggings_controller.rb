class TaggingsController < ApplicationController

  def create
    tagging = build_tagging_and_set_tag_values_taggable_id(params[:tag])
    get_taggable_type(params[:taggable_type].to_s)
    @level = params[:level]
    @tag = Tag.find(tagging.tag_id)
    if @tag.parent_id.nil?
      parent_id = ''
    else
      parent_id = '?parent_id='+@tag.parent_id.to_s
    end
    tagging.save
    respond_to do |format|
      if parent_id.to_s.eql?('')
        format.html { redirect_to '/edit_' << params[:taggable_type].to_s.downcase << '_taggings?instance=' << @the_instance.id.to_s }
      else
        format.html { redirect_to '/edit_' << params[:taggable_type].to_s.downcase << '_taggings' << parent_id.to_s << '&instance=' << @the_instance.id.to_s }
      end
      format.js { render '/taggings/base.js.erb' }
    end
  end
  
  def destroy
    @level = params[:level]
    get_taggable_type(params[:taggable_type].to_s)
    tagging = Tagging.find_by_taggable_type_and_taggable_id_and_tag_id(params[:taggable_type], params[:taggable_id], params[:tag])
    @tag = Tag.find(tagging.tag_id)
    if @tag.parent_id.nil?
      parent_id = ''
    else
      parent_id = '?parent_id='+@tag.parent_id.to_s
    end
    tagging.destroy
    respond_to do |format|
      if parent_id.to_s.eql?('')
        format.html { redirect_to '/edit_' << params[:taggable_type].to_s.downcase << '_taggings?instance=' << @the_instance.id.to_s }
      else
        format.html { redirect_to '/edit_' << params[:taggable_type].to_s.downcase << '_taggings' << parent_id.to_s << '&instance=' << @the_instance.id.to_s }
      end
      format.js { render '/taggings/base.js.erb' }
    end
  end
  
  def add_tagging_and_remove_the_rest
    get_taggable_type(params[:taggable_type].to_s)
    @tag = Tag.find(params[:tag])
    tags_to_remove = Tag.find_all_by_parent_id(params[:tag])
    tags_to_remove.each do |tag|
      unless tag.taggings.find_by_tag_id_and_taggable_id(tag.id, params[:taggable_id]).nil?
        tag.taggings.find_by_tag_id_and_taggable_id(tag.id, params[:taggable_id]).destroy
      end
    end
    unless params[:child_tag][:id].to_s.eql?('')
      tagging = build_tagging_and_set_tag_values_taggable_id(params[:child_tag][:id])
      tagging.save
    end
    # for base.js.erb
    @update = true
    respond_to do |format|
      format.html { redirect_to '/edit_' << params[:taggable_type].to_s.downcase << '_taggings?instance=' << @the_instance.id.to_s }
      format.js { render '/taggings/base.js.erb' }
    end
  end
  
  private
  
  def get_taggable_type(type)
    the_class = Kernel.const_get(type)
    @the_instance = the_class.find(params[:taggable_id])
  end
  
  def build_tagging_and_set_tag_values_taggable_id(tag_id)
    tagging = Tagging.new
    tagging.taggable_type = params[:taggable_type]
    tagging.tag_id = tag_id
    tagging.taggable_id = params[:taggable_id]
    
    return tagging
  end
end