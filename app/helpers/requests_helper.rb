module RequestsHelper
  
  def added_request_child_tags(tag, instance_id)
    the_class = Kernel.const_get(tag.taggable_type.to_s)
    if the_class.class.superclass.to_s.eql?('Item')
      the_class = Kernel.const_get('Item')
    end
    the_instance = the_class.find(instance_id)
    return the_instance.tags.find_all_by_parent_id(tag.id, :order => "position")
  end
  
end
