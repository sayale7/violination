class WelcomeController < ApplicationController
  
  def index
    show_on_map
  end
  
  private
  
  def show_on_map
    @map = GMap.new("map_div")
    @map.control_init(:large_map => true, :map_type => true)
    @map.center_zoom_init([49.5874362000,10.9660867000],5)
    User.all.each do |user|
      if !(user.locations.first.lat.nil? || user.locations.first.lng.nil?)
        if user.full_name.to_s.eql?(' ')
          @map.overlay_init(GMarker.new([user.locations.first.lat,user.locations.first.lng], :title => user.username, :info_window => "<a href=/users/#{user.id}>#{user.username}</a> <br/> <p>#{user.locations.first.address}</p>"))
        else
          @map.overlay_init(GMarker.new([user.locations.first.lat,user.locations.first.lng], :title => user.full_name, :info_window => "<a href=/users/#{user.id}>#{user.full_name}</a> <br/> <p>#{user.locations.first.address}</p>"))
        end
      end
    end
  end
  
end
