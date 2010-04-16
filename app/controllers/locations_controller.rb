class LocationsController < ApplicationController
  
  def edit
    @location = Location.find(params[:id])
    render :template => '/locations/edit.haml'
  end
  
  def update
    @location = Location.find(params[:id])
    if @location.update_attributes(params[:location])
      #flash[:notice] = "Successfully updated location."
      redirect_to edit_location_path(@location)
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
  
end
