class InstrumentsController < ApplicationController
  
  def index
    if params[:user_id]
      @instruments = Instrument.find_all_by_user_id(params[:user_id])
    else
      @instruments = Instrument.all
    end
  end
  
  def show
    if params[:id]
      @the_instance = Instrument.find(params[:id])
    end
    @added_tags =  @the_instance.tags.find_all_by_parent_id(nil, 'Instrument')
    debugger
    @available_tags =  Tag.find_all_by_parent_id_and_taggable_type_and_taggable_kind(nil, 'Instrument', @the_instance.instrument_kind) - @added_tags
    @tag = Tag.find_by_taggable_type_and_parent_id_and_taggable_kind(@the_instance.class.to_s, nil, @the_instance.instrument_kind)
  end
  
  def new
    if params[:instrument_kind]
      @the_instance = Instrument.new
      @the_instance.instrument_kind = params[:instrument_kind]
      @the_instance.user_id = current_user.id
      if @the_instance.save
        redirect_to '/instruments/'+@the_instance.id.to_s
      end
    else
      redirect_to instruments_path
    end
  end
  
  def update
    @the_instance = Instrument.find(params[:id])
    if @the_instance.update_attributes(params[:instrument])
      redirect_to @the_instance
    else
      render :action => 'edit'
    end
  end
  
  def destroy
    @the_instance = Instrument.find(params[:id])
    @the_instance.destroy
    redirect_to instruments_url(:user_id => current_user)
  end
  
  def edit_instrument_taggings
    unless @the_instance
      @the_instance = Instrument.find(params[:instance])
    end
    @level = 0
    if params[:parent_id]
      @tags = Tag.find_all_by_taggable_type_and_parent_id('Instrument', params[:parent_id]) - @the_instance.tags
      @tag = Tag.find_by_taggable_type_and_parent_id('Instrument', params[:parent_id])
    else
      @tags = Tag.find_all_by_taggable_type_and_parent_id('Instrument', nil) - @the_instance.tags
      @tag = Tag.find_by_taggable_type_and_parent_id('Instrument', nil)
    end
  end
  
  def edit_inner_instrument_taggings
    @the_instance = current_user
    @level = params[:level]
    @tags = Tag.find_all_by_taggable_type_and_id('User', params[:parent_id]) - @the_instance.tags
    @tag = Tag.find_by_taggable_type_and_id('User', params[:parent_id])
    respond_to do |format|
      format.js { render '/users/edit_inner_user_taggings.js.erb' }
    end
  end
  
end
