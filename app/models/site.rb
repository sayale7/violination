class Site < ActiveRecord::Base
  
  acts_as_tree
  
  attr_accessible :german_name, :english_name, :siteable_type, :parent_id, :active, :position
  attr_writer :german_name, :english_name
  
  has_many :sitenames
  has_many :sitetexts, :foreign_key => "textable_id"
  
  after_save :assign_german_site_name, :assign_english_site_name
  
  def german_name
    german_name = self.sitenames.find_by_language('de')
    unless german_name.nil?
      german_name.value
    else
      ''
    end
  end
  
  def english_name
    english_name = self.sitenames.find_by_language('en')
    unless english_name.nil?
      english_name.value
    else
      ''
    end
  end
  
  private
  
  def assign_german_site_name
    sitename = Sitename.find_or_create_by_language_and_site_id('de', self.id)
    sitename.update_attribute(:value, @german_name)
  end

  def assign_english_site_name
    sitename = Sitename.find_or_create_by_language_and_site_id('en', self.id)
    sitename.update_attribute(:value, @english_name)
  end
end
