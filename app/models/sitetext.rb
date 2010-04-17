class Sitetext < ActiveRecord::Base
  attr_accessible :textable_type, :textable_id, :active, :archive, :position, :german_name, :english_name, :german_content, :english_content
  attr_writer :german_name, :english_name, :german_content, :english_content
  has_many :sitetextnames
  belongs_to :site
  
  after_save :assign_german_sitetextnames_name, :assign_english_sitetextnames_name
  
  def german_name
    german_name = self.sitetextnames.find_by_language('de')
    unless german_name.nil?
      german_name.value
    else
      ''
    end
  end
  
  def english_name
    english_name = self.sitetextnames.find_by_language('en')
    unless english_name.nil?
      english_name.value
    else
      ''
    end
  end
  
  
  def german_content
    german_content = self.sitetextnames.find_by_language('de')
    unless german_content.nil?
      german_content.content
    else
      ''
    end
  end
  
  def english_content
    english_content = self.sitetextnames.find_by_language('en')
    unless english_content.nil?
      english_content.content
    else
      ''
    end
  end
  
  private
  
  def assign_german_sitetextnames_name
    sitetextname = Sitetextname.find_or_create_by_language_and_sitetext_id('de', self.id)
    sitetextname.update_attribute(:value, @german_name)
    sitetextname.update_attribute(:content, @german_content)
  end

  def assign_english_sitetextnames_name
    sitetextname = Sitetextname.find_or_create_by_language_and_sitetext_id('en', self.id)
    sitetextname.update_attribute(:value, @english_name)
    sitetextname.update_attribute(:content, @english_content)
  end
  
  
end
