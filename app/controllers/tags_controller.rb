class TagsController < ApplicationController
  
  def index
    @tags = Tag.find_all_by_taggable_type_and_parent_id(params[:taggable_type], nil, :order => "position")
  end

  def new
    @tag = Tag.new
  end
  
  def show
    update
  end
  
  def create
    @tag = Tag.new(params[:tag])
    @tag.german_name = params[:tag][:german_name]
    @tag.english_name = params[:tag][:english_name]
    @tag.position = Tag.find_all_by_taggable_type_and_parent_id(@tag.taggable_type, @tag.parent_id).size
    if params[:parent_id]
      @tag.parent_id = params[:parent_id]
    else
      @tag.parent_id = nil
    end
    respond_to do |format|
      if @tag.save
        set_position(@tag.parent_id)
        format.html { 
          if @tag.parent_id.nil?
            redirect_to tags_path(@tag, :taggable_type => @tag.taggable_type)
          else
            redirect_to edit_tag_path(Tag.find(@tag.parent_id), :taggable_type => @tag.taggable_type)
          end
        }
        format.xml  { render :xml => @tag, :status => :created, :location => @tag }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @tag.errors, :status => :unprocessable_entity }
      end
    end
  end
  
  def edit
    @tag = Tag.find(params[:id])
  end
  
  def update
    @tag = Tag.find(params[:id])
    @tag.german_name = params[:tag][:german_name]
    @tag.english_name = params[:tag][:english_name]
    
    if @tag.update_attributes(params[:tag])
      redirect_to edit_tag_path(@tag, :taggable_type => @tag.taggable_type)
    else
      render :action => 'edit'
    end
  end
  
  def destroy
    @tag = Tag.find(params[:id])
    taggable_type = @tag.taggable_type
    parent_id = @tag.parent_id
    @tag.destroy
    if parent_id.nil?
      redirect_to tags_path(:taggable_type => @tag.taggable_type)
    else
      @tag = Tag.find(parent_id)
      redirect_to edit_tag_path(@tag, :taggable_type => @tag.taggable_type)
    end
  end
  
  def move_tag_up
    tag = Tag.find(params[:tag])
    unless tag.position == 0
      change_pos(true, tag)
    end
    if tag.parent_id.nil?
      redirect_to tags_path(:taggable_type => tag.taggable_type)
    else
      @tag = Tag.find(tag.parent_id)
      redirect_to edit_tag_path(@tag, :taggable_type => @tag.taggable_type)
    end
  end
  
  def move_tag_down
    tag = Tag.find(params[:tag])
    unless tag.position == (Tag.find_all_by_parent_id(tag.parent_id).size-1)
      change_pos(false, tag)
    end
    if tag.parent_id.nil?
      redirect_to tags_path(:taggable_type => tag.taggable_type)
    else
      @tag = Tag.find(tag.parent_id)
      redirect_to edit_tag_path(@tag, :taggable_type => @tag.taggable_type)
    end
  end
  
  def clone_tag_with_sub_tags
    tag = Tag.find(params[:tag])
    clone_tag = tag.clone
    clone_tag.position = Tag.find_all_by_taggable_type_and_parent_id(tag.taggable_type, tag.parent_id).size
    clone_tag.save
    clone_tag.english_name = tag.english_name.to_s << ' clone'
    clone_tag.german_name = tag.german_name << ' clone'
    clone_tag.save
    @tag = clone_tag
    Tag.find_all_by_parent_id(tag.id).each do |tag|
      clone_tag = tag.clone
      clone_tag.parent_id = @tag.id
      clone_tag.save
      clone_tag.english_name = tag.english_name
      clone_tag.german_name = tag.german_name
      clone_tag.save
    end
    if @tag.parent_id.nil?
      redirect_to tags_path(@tag, :taggable_type => @tag.taggable_type)
    else
      redirect_to edit_tag_path(Tag.find(@tag.parent_id), :taggable_type => @tag.taggable_type)
    end
  end
  
  private
 
  def set_position(parent_id)
    tags = Tag.find_all_by_parent_id(parent_id, :order => 'position')
    tags.each_with_index do |_tag, index|
      _tag.german_name = _tag.german_name
      _tag.english_name = _tag.english_name
      _tag.update_attribute('position', index)
    end
  end
  
  def change_pos(up, tag)
    tag.german_name = tag.german_name
    tag.english_name = tag.english_name
    if up
      ancestor_tag = Tag.find_by_position_and_parent_id_and_taggable_type((tag.position - 1), tag.parent_id, params[:taggable_type])
      new_id = ancestor_tag.position
      tag.update_attribute(:position, ancestor_tag.position)
      ancestor_tag.german_name = ancestor_tag.german_name
      ancestor_tag.english_name = ancestor_tag.english_name
      ancestor_tag.update_attribute(:position, ancestor_tag.position+1)
    else
      ancestor_tag = Tag.find_by_position_and_parent_id_and_taggable_type((tag.position + 1), tag.parent_id, params[:taggable_type])
      new_id = ancestor_tag.position
      tag.update_attribute(:position, ancestor_tag.position)
      ancestor_tag.german_name = ancestor_tag.german_name
      ancestor_tag.english_name = ancestor_tag.english_name
      ancestor_tag.update_attribute(:position, ancestor_tag.position-1)
    end
  end
  
end
