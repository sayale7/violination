class Photo < ActiveRecord::Base
  
  belongs_to :photo_container, :polymorphic => true

  has_attachment :content_type => :image,
                 :storage => :file_system,
                 :size => 1 .. 1024.kilobytes,
                 :thumbnails => { :thumb => '140x140!' },
                 :processor => :MiniMagick
                 
  validates_as_attachment
  
  before_thumbnail_saved do |thumbnail|
    image = Photo.find_by_id(thumbnail.parent_id)
    thumbnail.photo_container_id = image.photo_container_id
    thumbnail.photo_container_type = image.photo_container_type
  end

  
end
