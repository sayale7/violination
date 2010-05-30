class PhotoContainersController < ApplicationController
  def index
    @photo_containers = PhotoContainer.all
  end
  
  def show
    
  end
  
  def new
    @the_instance = PhotoContainer.new
  end
  
  def create
    @the_instance = PhotoContainer.new(params[:photo_container])
    if @the_instance.save
      redirect_to photo_containers_url
    else
      render :action => 'edit'
    end
  end
  
  def edit
    @the_instance = PhotoContainer.find(params[:id])
    @photos = @the_instance.photos.find_all_by_photo_container_type_and_parent_id('PhotoContainer', nil )
  end
  
  def update
    @the_instance = PhotoContainer.find(params[:id])
    if @the_instance.update_attributes(params[:photo_container])
      redirect_to photo_containers_url
    else
      render :action => 'edit'
    end
  end
  
  def destroy
    @the_instance = PhotoContainer.find(params[:id])
    @the_instance.destroy
    flash[:notice] = "Successfully destroyed photo container."
    redirect_to photo_containers_url
  end
end
