class SessionsController < ApplicationController
  def new
  end
  
  def create
    user = User.authenticate(params[:login], params[:password])
    if user
      session[:user_id] = user.id
      flash[:notice] = t('session.created')
      redirect_to user_path(user)
    else
      flash.now[:error] = t('session.invalid_credentials')
      render :action => 'new'
    end
  end
  
  def destroy
    session[:user_id] = nil
    session[:search_input] = nil
    flash[:notice] = t('session.destroyed')
    redirect_to root_url
  end
end
