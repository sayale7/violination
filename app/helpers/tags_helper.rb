module TagsHelper
  
  def taggable_type
    return request.url.scan(/taggable_type=(\w+)/).to_s
  end
  
  def taggable_kind
    return request.url.scan(/taggable_kind=(\w+)/).to_s
  end
  
  def child_tags(tag)
    return Tag.find_all_by_parent_id(tag.id, :order => "position")
  end
  
  def added_child_tags(tag, instance_id)
    the_class = Kernel.const_get(tag.taggable_type.to_s)
    the_instance = the_class.find(instance_id)
    return the_instance.tags.find_all_by_parent_id(tag.id, :order => "position")
  end
  
  def available_child_tags(tag, instance_id)
    return get_available_tags(tag, instance_id)
  end
  
  def find_leveled_child_tag(tag, level)
    level.to_i.times do 
      tag = Tag.find_by_parent_id(tag.id)
    end
    return tag
  end

  def user_child_tags(tag, user)
    tag_id_list = Array.new
    tag.children.each do |tag|
      tag.taggings.find_all_by_taggable_id_and_tag_id(user.id, tag.id).each do |tagging|
        tag_id_list.push(Tag.find(tagging.tag_id).id)
      end
    end
    child_tags = Tag.find_all_by_id(tag_id_list, :order  => 'position')
    # tag_list.sort_by { |a| [ a.position ] }
    # tag_list = tag_list
    return child_tags
  end
  
  def get_available_tags(tag, taggable_id)
    the_class = Kernel.const_get(tag.taggable_type.to_s)
    the_instance = the_class.find(taggable_id)
    if request.url.include?('parent_id')
      return Tag.find_all_by_parent_id_and_taggable_type(request.url.scan(/parent_id=(\w+)/).to_s, tag.taggable_type, :order => "position") - the_instance.tags
    else
      if tag.nil?
        return Tag.find_all_by_parent_id_and_taggable_type(nil, 'User', :order => "position") - the_instance.tags
      else
        return Tag.find_all_by_parent_id_and_taggable_type(tag.parent_id, tag.taggable_type, :order => "position") - the_instance.tags
      end
    end
  end
  
  def get_all_tags(tag, taggable_id)
    the_class = Kernel.const_get(tag.taggable_type.to_s)
    the_instance = the_class.find(taggable_id)
    if request.url.include?('parent_id')
      return Tag.find_all_by_parent_id_and_taggable_type(request.url.scan(/parent_id=(\w+)/).to_s, tag.taggable_type, :order => "position") 
    else
      if tag.nil?
        return Tag.find_all_by_parent_id_and_taggable_type(nil, 'User', :order => "position") 
      else
        return Tag.find_all_by_parent_id_and_taggable_type(tag.parent_id, tag.taggable_type, :order => "position")
      end
    end
  end
  
  def get_added_tags(tag, taggable_id) 
    the_class = Kernel.const_get(tag.taggable_type.to_s)
    the_instance = the_class.find(taggable_id)
    if request.url.include?('parent_id')
      return the_instance.tags.find_all_by_parent_id_and_taggable_type(request.url.scan(/parent_id=(\w+)/).to_s, tag.taggable_type, :order => "position")
    else
      if tag.nil?
        return the_instance.tags.find_all_by_parent_id_and_taggable_type(nil, 'User', :order => "position")
      else
        return the_instance.tags.find_all_by_parent_id_and_taggable_type(tag.parent_id, tag.taggable_type, :order => "position")
      end
    end
  end
  
  def get_parent_tag(tag)
    if request.url.include?('parent_id')
      return Tag.find(request.url.scan(/parent_id=(\w+)/).to_s)
    else
      return Tag.find(tag.parent_id)
    end
  end
  
  def root_tag
    if get_parent_tag.parent_id.nil?
      return get_parent_tag
    else
      return get_parent_tag.ancestors.last
    end
  end
  
  def reached_depth(tag)
    tag = Tag.find(tag)
    if tag.ancestors.size > 2
      return true
    else
      return false
    end
  end
  
  def to_deep_to_clone(tag)
    tag = Tag.find(tag)
    tag.children.each do |child_tag|
      unless child_tag.children.empty?
        return true
      end
    end
    return false
  end
  
  def tagged_tag_name(tag, the_instance)
    child_tags(tag).each do |child|
      child.taggings.each do |tagging|
        tmp_instance = the_instance.class.find(tagging.taggable_id)
        if(tmp_instance.id == the_instance.id)
          return Tag.find(tagging.tag_id).tag_names.find_by_language(get_locale.to_s).value
        end
      end
    end
    return ''
  end
  
  def get_selected_child_tag_id(tag, the_instance)
    tagging = Tagging.find_by_tag_id_and_taggable_id(tag.children, the_instance.id)
    unless tagging.nil?
      return tagging.tag_id
    else
      return nil
    end
  end
  
  def get_price_format(tag_value)
    return_string = ''
    unless tag_value.to_s.eql?('')
      comma = tag_value.to_s[tag_value.to_s.size - 3 ,tag_value.to_s.size]
      string_to_split = tag_value.to_s[0 ,tag_value.to_s.size - 3].reverse
      times_to_loop = string_to_split.to_s.size / 3
      i = 1
      times_to_loop.times do
        string_to_split = string_to_split.insert((i*3)+(i-1), '.')
        i = i + 1
      end
      return_string = string_to_split.reverse << comma
      if return_string[0, 1].to_s.eql?('.')
        return return_string[1 ,return_string.size]
      else
        return return_string
      end
    end
  end
  
  def above_base_level(added, availables)
    unless added.empty?
      added.first.parent_id
    else
      availables.first.parent_id
    end
  end
  
end
