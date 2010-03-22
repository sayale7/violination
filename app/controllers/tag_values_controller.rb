class TagValuesController < ApplicationController
  
  def update_tag_values
    german_tag_value = TagValue.find(params[:id])
    english_tag_value = TagValue.find(params[:id].to_i + 1)
    german_value = params[:german_value].to_s
    english_value = params[:english_value].to_s
    @tag = Tag.find(german_tag_value.tag_id)
    get_taggable_type(german_tag_value.taggable_type, german_tag_value.taggable_id)
    error = false
    if @tag.value_type.to_s.eql?('preisfeld') && german_value.match(/^[1-9]{1}\d*\,\d{2}$/)
      english_value = german_value
      german_tag_value.update_attribute(:value, german_value)
      english_tag_value.update_attribute(:value, english_value)
    else
      error = true
    end
    if @tag.value_type.to_s.eql?('zahlenfeld_mit_sonderzeichen')
      english_value = german_value
      german_tag_value.update_attribute(:value, german_value)
      english_tag_value.update_attribute(:value, english_value)
    end
    if !@tag.value_type.to_s.eql?('preisfeld')
      german_tag_value.update_attribute(:value, german_value)
      english_tag_value.update_attribute(:value, english_value)
    end
    respond_to do |format|
      format.html { 
        if error
          flash[:error] = t('common.number_validate_error')
        end
        unless @tag.parent_id.nil?
          redirect_to '/edit_' << german_tag_value.taggable_type.to_s.downcase << '_taggings?instance=' << @the_instance.id.to_s << '&parent_id=' << @tag.parent_id.to_s
        else
          redirect_to '/edit_' << german_tag_value.taggable_type.to_s.downcase << '_taggings?instance=' << @the_instance.id.to_s
        end
      }
      format.js { 
        @update = true
        render '/taggings/base.js.erb' 
      }
    end
  end

  private
  
  def get_taggable_type(type, id)
    the_class = Kernel.const_get(type)
    @the_instance = the_class.find(id)
  end
  
end
