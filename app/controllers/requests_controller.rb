class RequestsController < ApplicationController
  def index
    @requests = Request.all
  end
  
  def show
    @request = Request.find(params[:id])
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
      flash[:notice] = "Successfully updated request."
      redirect_to @request
    else
      render :action => 'edit'
    end
  end
  
  def destroy
    @request = Request.find(params[:id])
    @request.destroy
    flash[:notice] = "Successfully destroyed request."
    redirect_to requests_url
  end
end
