class LocationsController < ApplicationController
  
  def edit
    @location = Location.find(params[:id])
    respond_to do |format|
      format.html { 
        render :template => '/locations/edit.haml'
      }
      format.js { 
        render '/items/popup.js.erb'
      }
    end
  end
  
  def update
    @location = Location.find(params[:id])
    if @location.update_attributes(params[:location])
      redirect_to get_redirect_string
    else
      render :action => 'edit'
    end
  end
  
  def add_location_to_user
    User.all.each do |user|
      Location.find_or_create_by_taggable_id_and_taggable_type(user.id, 'User')
    end
    redirect_to '/users'
  end
  
  def add_location_to_items
    Item.all.each do |item|
      Location.find_or_create_by_taggable_id_and_taggable_type(item.id, item.item_type)
    end
    redirect_to '/'
  end
  
  def get_redirect_string
    if @location.taggable_type.eql?('User')
      return "/users/#{@location.taggable_id}"
    else
      return "/items/#{@location.taggable_id}?taggable_type=#{@location.taggable_type}"
    end
  end
  
end
