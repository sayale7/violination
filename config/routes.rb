ActionController::Routing::Routes.draw do |map|

  #routes for Tags
  map.resources :tags
  map.update_tag 'update_tag', :controller => 'tags', :action => 'update'
  map.move_tag_up 'move_tag_up', :controller => 'tags', :action => 'move_tag_up'
  map.move_tag_down 'move_tag_down', :controller => 'tags', :action => 'move_tag_down'
  map.clone_tag_with_sub_tags 'clone_tag_with_sub_tags', :controller => 'tags', :action => 'clone_tag_with_sub_tags'
  
  #routes for user taggings edit_user_taggings_new
  map.resource :workshop
  # map.workshop 'workshop', :controller => 'workshops', :action => 'show'
  # map.edit_workshop 'edit', :controller => 'workshops', :action => 'edit'
  
  
  # Added custom post action (swfupload) to the photo resource
   map.resources :photos, :collection => { :swfupload => :post }
  
  #routes for bows and bows taggings
  map.resources :bows, :has_many  => :photos
  map.edit_bow_taggings 'edit_bow_taggings', :controller => 'bows', :action => 'edit_bow_taggings'
  
  #routes for intrument and instrument taggings
  map.resources :stringgs, :has_many  => :photos
  map.edit_instrument_taggings 'edit_instrument_taggings', :controller => 'stringgs', :action => 'edit_instrument_taggings'
  
  #routes for add/remove Taggings for Users and Instruments
  map.resources :taggings
  map.add_taggings 'add_taggings', :controller => 'taggings', :action => 'create'
  map.remove_taggings 'remove_taggings', :controller => 'taggings', :action => 'destroy'
  map.add_tagging_and_remove_the_rest 'add_tagging_and_remove_the_rest', :controller => 'taggings', :action => 'add_tagging_and_remove_the_rest'
  map.refresh_available_tags 'refresh_available_tags', :controller => 'taggings', :action => 'refresh_available_tags'
  
  #routes for tag_values
  map.update_tag_values 'update_tag_values', :controller => 'tag_values', :action => 'update_tag_values'

  map.signup 'signup', :controller => 'users', :action => 'new'
  map.logout 'logout', :controller => 'sessions', :action => 'destroy'
  map.login 'login', :controller => 'sessions', :action => 'new'
  map.resources :sessions

  map.resources :users
  
  map.root :controller => "users", :action => "index"

  map.connect ':controller/:action/:id'
  map.connect ':controller/:action/:id.:format'
  
  
end
