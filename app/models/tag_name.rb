class TagName < ActiveRecord::Base
  attr_accessible :tag_id, :value, :language
  belongs_to :tag
end
