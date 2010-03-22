class BowsController < ApplicationController
  
  def index
    @bows = Bow.all #find_all_by_user_id(params[:user_id])
  end
  
  def show
    if params[:id]
      @the_instance = Bow.find(params[:id])
    end
    @tags = Tag.find_all_by_taggable_type_and_parent_id('Bow', nil) - @the_instance.tags
    @tag = Tag.find_by_taggable_type_and_parent_id('Bow', nil)
  end
  
  def new
    @the_instance = Bow.new
    @the_instance.user_id = current_user.id
    if @the_instance.save
      redirect_to '/bows/'+@the_instance.id.to_s
    end
  end
  
  def update
    @the_instance = Bow.find(params[:id])
    if @the_instance.update_attributes(params[:instrument])
      redirect_to @the_instance
    else
      render :action => 'edit'
    end
  end
  
  def destroy
    @the_instance = Bow.find(params[:id])
    @the_instance.destroy
    redirect_to bows_url(:user_id => current_user)
  end
  
  def edit_bow_taggings
    unless @the_instance
      @the_instance = Bow.find(params[:instance])
    end
    @level = 0
    if params[:parent_id]
      @tags = Tag.find_all_by_taggable_type_and_parent_id('Bow', params[:parent_id]) - @the_instance.tags
      @tag = Tag.find_by_taggable_type_and_parent_id('Bow', params[:parent_id])
    else
      @tags = Tag.find_all_by_taggable_type_and_parent_id('Bow', nil) - @the_instance.tags
      @tag = Tag.find_by_taggable_type_and_parent_id('Bow', nil)
    end
  end
  
  # def edit_inner_instrument_taggings
  #     @the_instance = current_user
  #     @level = params[:level]
  #     @tags = Tag.find_all_by_taggable_type_and_id('User', params[:parent_id]) - @the_instance.tags
  #     @tag = Tag.find_by_taggable_type_and_id('User', params[:parent_id])
  #     respond_to do |format|
  #       format.js { render '/users/edit_inner_user_taggings.js.erb' }
  #     end
  #   end
  
end
