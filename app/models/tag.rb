class Tag < ActiveRecord::Base
  
  acts_as_tree
  
  attr_accessible :taggable_type, :taggable_id, :value_type, :german_name, :english_name
  attr_writer :german_name, :english_name
  
  has_many :tag_names, :dependent => :destroy
  has_many :tag_values, :dependent => :destroy
  has_many :taggings, :dependent => :destroy
  has_many :taged_by_user, :through => :taggings
  
  after_save :assign_german_tag_name, :assign_english_tag_name
  
  def german_name
    german_name = self.tag_names.find_by_language('de')
    unless german_name.nil?
      german_name.value
    else
      ''
    end
  end
  
  def english_name
    english_name = self.tag_names.find_by_language('en')
    unless english_name.nil?
      english_name.value
    else
      ''
    end
  end
  
  private
  
  def assign_german_tag_name
    tag_name = TagName.find_or_create_by_language_and_tag_id('de', self.id)
    tag_name.update_attribute(:value, @german_name)
  end

  def assign_english_tag_name
    tag_name = TagName.find_or_create_by_language_and_tag_id('en', self.id)
    tag_name.update_attribute(:value, @english_name)
  end
  
  
end
