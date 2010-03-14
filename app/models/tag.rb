class Tag < ActiveRecord::Base
  
  acts_as_tree
  
  has_many :tag_names, :dependent => :destroy
  has_many :taggings, :dependent => :destroy
  has_many :taged_by_user, :through => :taggings
  
  attr_accessible :taggable_type, :taggable_id

  after_save :assign_german_tag_name
  after_save :assign_english_tag_name

  attr_writer :german_name, :english_name 
  
  def german_name
    unless self.tag_names.find_by_language('de').nil?
      self.tag_names.find_by_language('de').value
    end
  end
  
  def english_name
    unless self.tag_names.find_by_language('en').nil?
      self.tag_names.find_by_language('en').value
    end
  end
  
  private
  
  def assign_german_tag_name
    unless TagName.find_by_tag_id_and_language(self.id, 'de').nil?
      tag_name = TagName.find_by_tag_id_and_language(self.id, 'de')
      tag_name.update_attributes(:language => 'de', :value => @german_name, :tag_id => self.id)
      tag_name.save
    else
      TagName.find_or_create_by_language_and_value_and_tag_id('de', @german_name, self.id)
    end
  end

  def assign_english_tag_name
    unless TagName.find_by_tag_id_and_language(self.id, 'en').nil?
      tag_name = TagName.find_by_tag_id_and_language(self.id, 'en')
      tag_name.update_attributes(:language => 'en', :value => @english_name, :tag_id => self.id)
      tag_name.save
    else
      TagName.find_or_create_by_language_and_value_and_tag_id('en', @english_name, self.id)
    end
  end
  
end
