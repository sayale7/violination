class Bow < ActiveRecord::Base
  
  include Item
  
  attr_accessible :user_id
  
  has_many :taggings, :as => :taggable, :dependent => :destroy
  has_many :tag_values, :as => :taggable, :dependent => :destroy
  has_many :tags, :order => 'position', :through => :taggings
  has_many :tags_over_value, :through => :tag_values
  has_many :photos, :dependent => :destroy, :foreign_key => 'photo_container_id'
  belongs_to :user
  
end
