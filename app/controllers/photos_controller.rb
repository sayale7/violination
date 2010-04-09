class PhotosController < ApplicationController
  # FIXME: Pass sessions through to allow cross-site forgery protection
  protect_from_forgery :except => :swfupload
  
  def index
    @photos = Photo.find_all_by_parent_id(nil)
  end
  
  def update
    photo = Photo.find(params[:id])
    get_taggable_type(photo.photo_container_type, photo.photo_container_id)
    if photo.update_attribute("description", params[:photo][:description].to_s)
        #flash[:notice] = t("common.updated")
        get_instance_tags_and_photos
        respond_to do |format|
          format.html { redirect_to "/items/show?taggable_type=#{@the_instance.class.to_s}&id=#{@the_instance.id}" }
          format.js { render '/photos/update.js.erb'}
        end
    end
  end
  
  def new
    @user = current_user
    @photo = Photo.new
  end
  
  def create
    if params[:photo] 
      @photo = Photo.new(params[:photo])
      @photo.photo_container_type = params[:container_type].to_s.gsub('_','')
      @photo.photo_container_id = params[:container_id].to_s
      if @photo.save
        flash[:notice] = t("common.create_success")
        respond_to do |format|
          format.html { redirect_to '/'+params[:container_type].to_s.downcase.pluralize+ '/' +params[:container_id].to_s+'/edit'}
          format.js { }
        end
      end
    else
      redirect_to '/'+params[:container_type].to_s.downcase.pluralize+ '/' +params[:container_id].to_s+'/edit'
    end
  end
  
  def swfupload
    # swfupload action set in routes.rb
    @photo = Photo.new :uploaded_data => params[:Filedata]
    @photo.photo_container_id = params[:token]
    @photo.photo_container_type = params[:type]
    #@photo.description = @photo.filename
    @photo.save
    
    # This returns the thumbnail url for handlers.js to use to display the thumbnail
    render :text => @photo.public_filename(:thumb)
  rescue
    logger.info ("photo error: " + e)
    render :text => e
  end
  
  def show
    destroy
  end
  
  
  def edit
    @photo = Photo.find(params[:id])
  end

  
  def destroy
    photo = Photo.find(params[:id])
    get_taggable_type(photo.photo_container_type, photo.photo_container_id)
    if photo.destroy
      #flash[:notice] = t("common.delete_success")
      get_instance_tags_and_photos
      respond_to do |format|
        format.html { redirect_to "/items/show?taggable_type=#{@the_instance.class.to_s}&id=#{@the_instance.id}" }
        format.js { 
          render '/photos/destroy.js.erb'
        }
      end
    end
  end
  
  private
  
  def get_taggable_type(type, id)
    the_class = Kernel.const_get(type)
    @the_instance = the_class.find(id)
  end
  
  def get_instance_tags_and_photos
    @added_tags =  @the_instance.tags.find_all_by_parent_id(nil)
    @available_tags = Tag.find_all_by_taggable_type_and_parent_id(@the_instance.class.to_s, nil) - @added_tags
    @photo = Photo.new
    @photos = Photo.find_all_by_photo_container_id_and_thumbnail_and_photo_container_type(@the_instance.id, nil, @the_instance.class.to_s)
  end
  
end
