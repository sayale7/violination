class Item < ActiveRecord::Base
  
  attr_accessible :user_id, :contact, :item_type
  
  has_many :taggings, :as => :taggable, :dependent => :destroy
  has_many :tag_values, :as => :taggable, :dependent => :destroy
  has_many :tags, :order => 'position', :through => :taggings
  has_many :tags_over_value, :through => :tag_values
  has_many :photos, :dependent => :destroy, :foreign_key => 'photo_container_id'
  has_many :locations, :dependent => :destroy, :foreign_key => 'taggable_id'
  belongs_to :user
  
  after_save :create_location
  
  def maximum_file_size
    return '1 MB'
  end
  
  def maximum_file_count
    return 6
  end

  private
  
  def assign_german_tag_value
    self.tag_values.find_by_language('de').update_attributes(:taggable_id => self.id)
  end

  def assign_english_tag_value
    self.tag_values.find_by_language('en').update_attributes(:language => 'en', :tag_id => self.id, :taggable_type  => @taggable_type, :type => @type)
  end
  
  def create_location
    Location.find_or_create_by_taggable_id_and_taggable_type(self.id, 'Item')
  end
  
end
