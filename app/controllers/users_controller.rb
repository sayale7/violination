class UsersController < ApplicationController
  
  def index
    @users = User.all
    session[:search_input] = nil
    show_on_map
  end
  
  def show
    @user = User.find(params[:id])
    @added_tags =  @user.tags.find_all_by_parent_id(nil)
    respond_to do |format|
      format.html {user_path(@user)}
    end
  end
  
  def edit
    @user = current_user
  end
  
  def new
    @user = User.new
  end
  
  def create
    @user = User.new(params[:user])
    if @user.save
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      render :action => 'new'
    end
  end
  
  def update
    @user = current_user
    if @user.update_attributes(params[:user])
      redirect_to user_path(current_user)
    else
      render :action => 'edit'
    end
  end
  
  def destroy
    @user = current_user
    session[:user_id] = nil
    @user.destroy
    redirect_to users_url
  end
  
  def edit_user_taggings
    @the_instance = current_user
    if params[:parent_id]
      @tags = Tag.find_all_by_taggable_type_and_parent_id('Workshop', params[:parent_id]) - @the_instance.tags
      @tag = Tag.find_all_by_taggable_type_and_parent_id('Workshop', params[:parent_id]).first
    else
      @tags = Tag.find_all_by_taggable_type_and_parent_id('Workshop', nil) - @the_instance.tags
      @tag = Tag.find_all_by_taggable_type_and_parent_id('Workshop', nil).first
    end
  end
  
  
  def edit_user_taggings_js
    if params[:id]
      @the_instance = User.find(params[:id])
    else
      @the_instance = current_user
    end
    @tags = Tag.find_all_by_taggable_type_and_parent_id('Workshop', nil) - @the_instance.tags
    @tag = Tag.find_by_taggable_type_and_parent_id('Workshop', nil)
  end
  
  def personals
    @the_instance = current_user
    @added_tags =  @the_instance.tags.find_all_by_parent_id(nil)
    @available_tags = Tag.find_all_by_taggable_type_and_parent_id('User', nil) - @added_tags
    @photo = Photo.new
    @photos = Photo.find_all_by_photo_container_id_and_thumbnail_and_photo_container_type(@the_instance.id, nil, 'User')
  end
  
  private
  
  def show_on_map
    @map = GMap.new("map_div")
    @map.control_init(:large_map => true, :map_type => true)
    @map.center_zoom_init([49.5874362000,10.9660867000],5)
    User.all.each do |user|
      if !(user.location.lat.nil? || user.location.lng.nil?)
        if user.full_name.to_s.eql?(' ')
          @map.overlay_init(GMarker.new([user.location.lat,user.location.lng], :title => user.username, :info_window => "<a href=/users/#{user.id}>#{user.username}</a> <br/> <p>#{user.location.address}</p>"))
        else
          @map.overlay_init(GMarker.new([user.location.lat,user.location.lng], :title => user.full_name, :info_window => "<a href=/users/#{user.id}>#{user.full_name}</a> <br/> <p>#{user.location.address}</p>"))
        end
      end
    end
  end
  
end
