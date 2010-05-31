class WelcomeController < ApplicationController
  
  def index
    show_on_map
    render :layout => '/layouts/application_2'
  end
  
  private
  
  def show_on_map
    @map = GMap.new("map_div")
    @map.control_init(:large_map => true, :map_type => true)
    @map.center_zoom_init([49.800499,13.080481],5)
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
