class User < ActiveRecord::Base
  
  has_many :taggings, :as => :taggable, :dependent => :destroy
  has_many :tag_values, :as => :taggable, :dependent => :destroy
  has_many :tags, :through => :taggings, :order  => 'position'
  has_many :tags_over_value, :through => :tag_values
  has_many :items, :dependent => :destroy
  has_many :bows, :dependent => :destroy
  has_many :photos, :foreign_key => 'photo_container_id'
  has_one :workshop, :dependent => :destroy
  has_many :photo_containers
  
  # new columns need to be added here to be writable through mass assignment
  attr_accessible :username, :email, :password, :password_confirmation, :firstname, :lastname, :public
  
  attr_accessor :password
  before_save :prepare_password
  after_save :create_workshop
  after_save :create_location
  before_destroy :destroy_location
  before_destroy :destroy_photos
  
  
  validates_presence_of :username
  validates_uniqueness_of :username, :email, :allow_blank => true
  #validates_format_of :username, :with => /^[-\w\._@]+$/i, :allow_blank => true, :message => "should only contain letters, numbers, or .-_@"
  validates_format_of :email, :with => /^[-a-z0-9_+\.]+\@([-a-z0-9]+\.)+[a-z0-9]{2,4}$/i
  validates_presence_of :password, :on => :create
  validates_confirmation_of :password
  validates_length_of :password, :minimum => 4, :allow_blank => true
  
  # login can be either username or email address
  def self.authenticate(login, pass)
    user = find_by_username(login) || find_by_email(login)
    return user if user && user.matching_password?(pass)
  end
  
  def matching_password?(pass)
    self.password_hash == encrypt_password(pass)
  end
  
  def maximum_file_size
    return '1 MB'
  end
  
  def maximum_file_count
    return 1
  end
  
  def full_name
    return self.firstname + ' ' + self.lastname
  end
  
  def profile_image
    return Photo.find_by_photo_container_id_and_photo_container_type(self.id, 'User')
  end
  
  def location
    Location.find_by_taggable_type_and_taggable_id('User', self.id)
  end
  
  private
  
  def prepare_password
    unless password.blank?
      self.password_salt = Digest::SHA1.hexdigest([Time.now, rand].join)
      self.password_hash = encrypt_password(password)
    end
  end
  
  def encrypt_password(pass)
    Digest::SHA1.hexdigest([pass, password_salt].join)
  end
  
  def create_workshop
    workshop = Workshop.new
    workshop.user_id = self.id
    workshop.save
  end
  
  def create_location
    Location.find_or_create_by_taggable_id_and_taggable_type(self.id, 'User')
  end
  
  
  def destroy_location
    location = Location.find_by_taggable_type_and_taggable_id('User', self.id)
    location.destroy
  end
  
  def destroy_photos
    photos = Photo.find_all_by_photo_container_type_and_photo_container_id('User', self.id)
    photos.each do |photo|
      photo.destroy
    end
  end
end
