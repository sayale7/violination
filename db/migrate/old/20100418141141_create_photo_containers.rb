class CreatePhotoContainers < ActiveRecord::Migration
  def self.up
    create_table :photo_containers do |t|
      t.string :name
      t.integer :user_id
      t.timestamps
    end
  end
  
  def self.down
    drop_table :photo_containers
  end
end
