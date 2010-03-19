class Tagging < ActiveRecord::Base
  
  belongs_to :tag
  belongs_to :taggable, :polymorphic => true
  after_save :assign_tag_values 
  
  private
  
  def assign_tag_values
    TagValue.find_or_create_by_language_and_tag_id_and_taggable_type_and_taggable_id('de', self.tag.id, self.taggable_type, self.taggable_id)
    TagValue.find_or_create_by_language_and_tag_id_and_taggable_type_and_taggable_id('en', self.tag.id, self.taggable_type, self.taggable_id)
  end
  
end
