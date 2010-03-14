module TagsHelper
  
  def taggable_type
    return request.url.scan(/taggable_type=(\w+)/).to_s
  end
  
  def child_tags(tag)
    return Tag.find_all_by_parent_id(tag.id, :order => "position")
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
  
  def get_available_tags(tag)
    if request.url.include?('parent_id')
      return Tag.find_all_by_parent_id_and_taggable_type(request.url.scan(/parent_id=(\w+)/).to_s, 'User', :order => "position") - current_user.tags
    else
      if tag.nil?
        return Tag.find_all_by_parent_id_and_taggable_type(nil, 'User', :order => "position") - current_user.tags
      else
        return Tag.find_all_by_parent_id_and_taggable_type(tag.parent_id, 'User', :order => "position") - current_user.tags
      end
    end
  end
  
  def get_user_tags(tag)
    if request.url.include?('parent_id')
      return current_user.tags.find_all_by_parent_id_and_taggable_type(request.url.scan(/parent_id=(\w+)/).to_s, 'User', :order => "position")
    else
      if tag.nil?
        return current_user.tags.find_all_by_parent_id_and_taggable_type(nil, 'User', :order => "position")
      else
        return current_user.tags.find_all_by_parent_id_and_taggable_type(tag.parent_id, 'User', :order => "position")
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
end
