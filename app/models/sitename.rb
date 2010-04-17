class Sitename < ActiveRecord::Base
  
  attr_accessible :site_id, :value, :language
  belongs_to :site

end
