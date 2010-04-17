class SitesController < ApplicationController
  def index
    @sites = Site.find_all_by_siteable_type_and_parent_id(params[:siteable_type], nil, :order => "position")
    @siteable_type = params[:siteable_type]
  end

  
  def new
    @site = Site.new
    @siteable_type = params[:siteable_type]
  end
  
  def create
    @site = Site.new(params[:site])
    @siteable_type = @site.siteable_type
    @site.position = Site.find_all_by_siteable_type_and_parent_id(@site.siteable_type, @site.parent_id).size
    if @site.save
      if @site.parent_id.nil?
        redirect_to sites_path(@site, :siteable_type => @site.siteable_type)
      else  
        redirect_to edit_site_path(Site.find(@site.parent_id), :siteable_type => @site.siteable_type)
      end
    else
      render :action => 'new'
    end
  end
  
  def edit
    @site = Site.find(params[:id])
    @siteable_type = params[:siteable_type]
  end
  
  def update
    @site = Site.find(params[:id])
    @siteable_type = @site.siteable_type
    if @site.update_attributes(params[:site])
      redirect_to "/sites?siteable_type=#{@site.siteable_type}"
    else
      render :action => 'edit'
    end
  end
  
  def destroy
    @site = Site.find(params[:id])
    parent_id = @site.parent_id
    siteable_type = @site.siteable_type
    @site.destroy
    set_position(parent_id, siteable_type)
    if parent_id.nil?
      redirect_to "/sites?siteable_type=#{@site.siteable_type}"
    else
      @site = Site.find(parent_id)
      redirect_to edit_site_path(@site, :siteable_type => @site.siteable_type)
    end
  end
  
  def move_site_up
    site = Site.find(params[:site])
    unless site.position == 0
      change_pos(true, site)
    end
    if site.parent_id.nil?
      redirect_to sites_path(:siteable_type => site.siteable_type)
    else
      @site = Site.find(site.parent_id)
      redirect_to edit_site_path(@site, :siteable_type => @site.siteable_type)
    end
  end
  
  def move_site_down
    site = Site.find(params[:site])
    unless site.position == (Site.find_all_by_parent_id(site.parent_id).size-1)
      change_pos(false, site)
    end
    if site.parent_id.nil?
      redirect_to sites_path(:siteable_type => site.siteable_type)
    else
      @site = Site.find(site.parent_id)
      redirect_to edit_site_path(@site, :siteable_type => @site.siteable_type)
    end
  end
  
  def show_sites
    @site = Site.find(params[:site])
  end
  
  private
  
  def set_position(parent_id, siteable_type)
    sites = Site.find_all_by_parent_id_and_siteable_type(parent_id, siteable_type, :order => 'position')
    sites.each_with_index do |_site, index|
      _site.german_name = _site.german_name
      _site.english_name = _site.english_name
      _site.update_attribute('position', index)
    end
  end
  
  def change_pos(up, site)
    site.german_name = site.german_name
    site.english_name = site.english_name
    if up
      ancestor_site = Site.find_by_position_and_parent_id_and_siteable_type((site.position - 1), site.parent_id, params[:siteable_type])
      new_id = ancestor_site.position
      site.update_attribute(:position, ancestor_site.position)
      ancestor_site.german_name = ancestor_site.german_name
      ancestor_site.english_name = ancestor_site.english_name
      ancestor_site.update_attribute(:position, ancestor_site.position+1)
    else
      ancestor_site = Site.find_by_position_and_parent_id_and_siteable_type((site.position + 1), site.parent_id, params[:siteable_type])
      new_id = ancestor_site.position
      site.update_attribute(:position, ancestor_site.position)
      ancestor_site.german_name = ancestor_site.german_name
      ancestor_site.english_name = ancestor_site.english_name
      ancestor_site.update_attribute(:position, ancestor_site.position-1)
    end
  end
  
end
