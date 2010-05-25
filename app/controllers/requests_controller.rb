class RequestsController < ApplicationController
  def index
    @requests = Request.all
  end
  
  def show
    @request = Request.find(params[:id])
    @the_instance = @request
    respond_to do |format|
      format.html {  }
      format.js { 
        render '/requests/popup.js.erb'
      }
    end
  end
  
  def new
    @request = Request.new
  end
  
  def create
    @request = Request.new(params[:request])
    if @request.save
      redirect_to edit_request_path(:id => @request.id)
    else
      render :action => 'new'
    end
  end
  
  def edit
    @the_instance = Request.find(params[:id])
    @added_tags =  @the_instance.tags.find_all_by_parent_id(nil)
    @available_tags = Tag.find_all_by_taggable_type_and_parent_id('Request', nil) - @added_tags
  end
  
  def update
    @request = Request.find(params[:id])
    if @request.update_attributes(params[:request])
      redirect_to @request
    else
      render :action => 'edit'
    end
  end
  
  def destroy
    @request = Request.find(params[:id])
    @request.destroy
    redirect_to requests_url
  end
  
  def send_request_email
    if ViolinationMailer.deliver_request_confirmation(Request.find(params[:request])) and ViolinationMailer.deliver_request_to_admin(Request.find(params[:request]))
      flash[:notice] = t('mailer.send_success')
      redirect_to root_url
    else
      flash[:error] = t('mailer.send_failure')
    end
  end
  
end
