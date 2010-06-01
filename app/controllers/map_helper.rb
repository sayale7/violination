module MapHelper
  
  def show_on_map
    @map = GMap.new("map_div")
    @map.control_init(:large_map => true, :map_type => true)
    @map.center_zoom_init([49.5874362000,10.9660867000],5)
    @map.icon_global_init( GIcon.new( :image => "/images/map_add.png", :icon_size => GSize.new( 20,20 ), :icon_anchor => GPoint.new(12,10), :info_window_anchor => GPoint.new(9,2) ), "group_icon")
    group_icon = Variable.new("group_icon");
    locations = Location.find_all_by_taggable_type(params[:taggable_type].to_s, :group => "address")
    locations.each do |group|
      locs = Location.find_all_by_address_and_taggable_type(group.address, params[:taggable_type].to_s)
      if locs.size == 1
        item = Item.find_by_id_and_contact(group.taggable_id, true)
        unless item.nil? or item.location.lat.nil? or item.location.lng.nil?
            @map.overlay_init(GMarker.new([item.location.lat,item.location.lng], :title => get_item_kind(item), :info_window => "<p>#{item.location.address}</p> #{get_map_info(item)} <p><a href='/items/#{item.id}?taggable_type=#{item.item_type}'>#{t('common.show')}</a></p>"))
        end
      else
        location_array = Array.new
        locs.each do |location|
          item = Item.find_by_id_and_contact(location.taggable_id, true)
          unless item.nil? or item.location.lat.nil? or item.location.lng.nil?
              location_array.push(GMarker.new([item.location.lat,item.location.lng], :icon => group_icon, :info_window => "<p>#{item.location.address}</p> <p>#{t('common.more')}</p> <p><a href='/items?contact=1&taggable_type=#{item.item_type}&user_id=#{item.user.id}'>#{t('common.show')}</a></p>"))
          end
        end
        @map.overlay_init(Clusterer.new(location_array,  :max_visible_markers => 100, :min_markers_per_cluster => 100))
      end
    end
  end
  
  def get_map_info(item)
    info = "<div style='width:250px'>"
    unless item.tags.find_by_parent_id(nil).nil?
      item.tags.find_all_by_parent_id(nil).each do |tag|
        if tag.visible.to_s.eql?('1') || tag.visible.to_s.eql?('true')
          info << "<strong>" << tag.tag_names.find_by_language(get_locale.to_s).value.to_s << "</strong>"
          if tag.children.empty?
            tag_value = TagValue.find_by_language_and_tag_id_and_taggable_id('de', tag.id, item.id)
            if tag.value_type.to_s.eql?('preisfeld')
                info << "- Euro " << get_price_format(tag_value.value) << "<br/>"
            else
              unless tag_value.nil? or tag_value.value.nil?
                info << "- " << tag_value.value  << "<br/>"
              else
                info << "<br/>"
              end
            end
          else
            info << "- " << tagged_tag_name(tag, item) << "<br/>"
          end
        end
      end
    end
    info << "</div>"
  end
  
  def get_item_kind(item)
    unless item.tags.empty?
      Tag.find_all_by_parent_id(item.tags.first.id).each do |the_tag|
        tagging = Tagging.find_by_tag_id_and_taggable_id(the_tag.id, item.id)
        unless tagging.nil?
          return Tag.find(tagging.tag_id).tag_names.find_by_language(get_locale.to_s).value
        end
      end
      return " "
    else
      return " "
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
  
  def child_tags(tag)
    return Tag.find_all_by_parent_id(tag.id, :order => "position")
  end
  
end
