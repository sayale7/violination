class PhotoContainer < ActiveRecord::Base
  attr_accessible :name, :user_id
  belongs_to :user
  has_many :photos, :dependent => :destroy, :foreign_key => 'photo_container_id'
  
  
  def maximum_file_size
    return '1 MB'
  end
  
  def maximum_file_count
    return 100
  end
  
end
