class Location < ActiveRecord::Base
  
  #acts_as_mappable :default_units  => :kms
  
  attr_accessible :lat, :lng, :distance, :taggable_type, :taggable_id, :address
  belongs_to :taggable, :polymorphic => true
  
end
