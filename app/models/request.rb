class Request < ActiveRecord::Base
  attr_accessible :name, :email
  
  validates_presence_of :name, :email
  validates_format_of :email, :with => /^[-a-z0-9_+\.]+\@([-a-z0-9]+\.)+[a-z0-9]{2,4}$/i
  
  has_many :taggings, :as => :taggable, :dependent => :destroy
  has_many :tag_values, :as => :taggable, :dependent => :destroy
  has_many :tags, :order => 'position', :through => :taggings
  has_many :tags_over_value, :through => :tag_values
  
end
