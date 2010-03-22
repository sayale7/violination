class TagValuesController < ApplicationController
  
  def update_tag_values
    german_tag_value = TagValue.find(params[:id])
    english_tag_value = TagValue.find(params[:id].to_i + 1)
    german_value = params[:german_value].to_s
    english_value = params[:english_value].to_s
    @tag = Tag.find(german_tag_value.tag_id)
    get_taggable_type(german_tag_value.taggable_type, german_tag_value.taggable_id)
    error = false
    if @tag.value_type.to_s.eql?('zahlenfeld') && german_value.match(/^\d+\,\d{2}$/)
      english_value = german_value
      german_tag_value.update_attribute(:value, german_value)
      english_tag_value.update_attribute(:value, english_value)
    else
      error = true
    end
    if !@tag.value_type.to_s.eql('zahlenfeld')
      english_value = german_value
      german_tag_value.update_attribute(:value, german_value)
      english_tag_value.update_attribute(:value, english_value)
    end
    respond_to do |format|
      format.html { 
        if error
          flash[:error] = t('common.number_validate_error')
        end
        redirect_to '/edit_' << german_tag_value.taggable_type.to_s.downcase << '_taggings?instance=' << @the_instance.id.to_s 
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
