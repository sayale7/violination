class ItemsController < ApplicationController
  
  def index   
    show_on_map 
    if params[:user_id]
      if params[:contact].to_s.eql?('1')
        @the_instances = get_taggable_type(params[:taggable_type].to_s).find_all_by_user_id_and_item_type_and_contact(params[:user_id], params[:taggable_type].to_s, true)
        @user_id = params[:user_id]
        @contact = '1'
      else
        @the_instances = get_taggable_type(params[:taggable_type].to_s).find_all_by_user_id_and_item_type(params[:user_id], params[:taggable_type].to_s)
        @user_id = params[:user_id]
        @contact = '0'
      end
    else
      @the_instances = get_taggable_type(params[:taggable_type].to_s).find_all_by_item_type(params[:taggable_type].to_s)
    end
    
    @taggable_type = params[:taggable_type].to_s
    session[:search_input] = nil
    unless @taggable_type.to_s.eql?('Request')
      render :template  => '/items/index.haml'
    else
      render :template  => '/items/requests.haml'
    end
  end
  
  def show
    if params[:id]
      @the_instance = get_taggable_type(params[:taggable_type].to_s).find(params[:id])
    end
    @added_tags =  @the_instance.tags.find_all_by_parent_id(nil)
    @available_tags = Tag.find_all_by_taggable_type_and_parent_id(@the_instance.item_type.to_s, nil) - @added_tags
    @photo = Photo.new
    @photos = Photo.find_all_by_photo_container_id_and_thumbnail_and_photo_container_type(@the_instance.id, nil, 'Item')
    render :action => 'show', :template  => '/items/show.haml'
  end
  
  def new
    @the_instance = Item.new
    unless current_user.nil?
      @the_instance.user_id = current_user.id
    end
    @the_instance.item_type = params[:taggable_type].to_s
    if @the_instance.save
      redirect_to "/#{params[:taggable_type].to_s.downcase.pluralize}/#{@the_instance.id}?taggable_type=#{params[:taggable_type].to_s}" 
    end
  end
  
  def update
    @the_instance = get_taggable_type(params[:taggable_type].to_s).find(params[:id])
    if params[:item][:contact].to_s.eql?('1')
      contact = 1
    else
      contact = 0
    end
    if @the_instance.update_attribute('contact', contact.to_i)
      redirect_to "/#{params[:taggable_type].to_s.downcase.pluralize}/#{@the_instance.id}?taggable_type=#{params[:taggable_type].to_s}"
    else
      render :action => 'edit'
    end
  end
  
  def destroy
    @the_instance = get_taggable_type(params[:taggable_type].to_s).find(params[:id])
    @the_instance.destroy
    redirect_to "/#{params[:taggable_type].to_s.downcase.pluralize}?user_id=#{current_user.id}&taggable_type=#{@the_instance.item_type.to_s}"
  end
  
  private
  
  def get_tag_for_instrument_kind(tag_name)
    ids = Array.new
    TagName.find_all_by_value(tag_name).each do |name|
      ids.push(name.tag_id)
    end
    return Tag.find_by_parent_id_and_id(nil, ids.uniq)
  end
  
  def root_tag(instrument_kind)
    Tag.find_all_by_parent_id_and_taggable_type(nil, 'Instrument').each do |tag|
      if tag.id == instrument_kind
        @tag = tag
      end
    end
  end
  
  def get_taggable_type(type)
    the_class = Kernel.const_get(type)
    if the_class.superclass.to_s.eql?('Item')
      the_class = Kernel.const_get('Item')
    end
    return the_class
  end
    # 
    # def edit_instrument_taggings
    #   unless @the_instance
    #     @the_instance = Instrument.find(params[:instance])
    #   end
    #   @level = 0
    #   if params[:parent_id]
    #     @tags = Tag.find_all_by_taggable_type_and_parent_id('Instrument', params[:parent_id]) - @the_instance.tags
    #     @tag = Tag.find_by_taggable_type_and_parent_id('Instrument', params[:parent_id])
    #   else
    #     @tags = Tag.find_all_by_taggable_type_and_parent_id('Instrument', nil) - @the_instance.tags
    #     @tag = Tag.find_by_taggable_type_and_parent_id('Instrument', nil)
    #   end
    # end
    # 
    # def edit_inner_instrument_taggings
    #   @the_instance = current_user
    #   @level = params[:level]
    #   @tags = Tag.find_all_by_taggable_type_and_id('User', params[:parent_id]) - @the_instance.tags
    #   @tag = Tag.find_by_taggable_type_and_id('User', params[:parent_id])
    #   respond_to do |format|
    #     format.js { render '/users/edit_inner_user_taggings.js.erb' }
    #   end
    # end
    
    private

    def show_on_map
      @map = GMap.new("map_div")
      @map.control_init(:large_map => true, :map_type => true)
      @map.center_zoom_init([49.5874362000,10.9660867000],5)
      Item.find_all_by_item_type(params[:taggable_type].to_s).each do |item|
        unless item.location.lat.nil? or item.location.lng.nil?
            @map.overlay_init(GMarker.new([item.locations.first.lat,item.locations.first.lng], :title => get_item_kind(item), :info_window => "<p>#{item.locations.first.address}</p> #{get_map_info(item)}"))
        end
      end
    end
    
    def get_map_info(item)
      info = "<p>"
      unless item.tags.find_by_parent_id(nil).nil?
        item.tags.find_all_by_parent_id(nil).each do |tag|
          if tag.visible.to_s.eql?('1') || tag.visible.to_s.eql?('true')
            info << "<strong>" << tag.tag_names.find_by_language(get_locale.to_s).value.to_s << "</strong>"
            if tag.children.empty?
              if tag.value_type.to_s.eql?('preisfeld')
                unless TagValue.find_by_language_and_tag_id_and_taggable_id('de', tag.id, item.id).nil?
                  info << "- Euro " << get_price_format(TagValue.find_by_language_and_tag_id_and_taggable_id('de', tag.id, item.id).value) or " " << "<br/>"
                end
              else
                info << "- " << TagValue.find_by_language_and_tag_id_and_taggable_id('de', tag.id, item.id).value or " " << "<br/>"
              end
            else
              info << "- " << tagged_tag_name(tag, item) or " " << "<br/>"
            end
          end
        end
      end
      info << "</p>"
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