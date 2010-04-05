module Item
  
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
  
end
