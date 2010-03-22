class UsersController < ApplicationController
  
  def index
    @users = User.all
  end
  
  def show
    @user = User.find(params[:id])
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
      redirect_to login_path
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
  
  def edit_user_taggings
    @the_instance = current_user
    if params[:parent_id]
      @tags = Tag.find_all_by_taggable_type_and_parent_id('User', params[:parent_id]) - @the_instance.tags
      @tag = Tag.find_all_by_taggable_type_and_parent_id('User', params[:parent_id]).first
    else
      @tags = Tag.find_all_by_taggable_type_and_parent_id('User', nil) - @the_instance.tags
      @tag = Tag.find_all_by_taggable_type_and_parent_id('User', nil).first
    end
  end
  
  
  def edit_user_taggings_js
    if params[:id]
      @the_instance = User.find(params[:id])
    else
      @the_instance = current_user
    end
    @tags = Tag.find_all_by_taggable_type_and_parent_id('User', nil) - @the_instance.tags
    @tag = Tag.find_by_taggable_type_and_parent_id('User', nil)
  end
  
end
