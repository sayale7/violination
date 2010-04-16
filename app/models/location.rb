class Location < ActiveRecord::Base
  
  attr_accessible :lat, :lng, :distance, :taggable_type, :taggable_id
  belongs_to :taggable, :polymorphic => true
  
  
  
end
