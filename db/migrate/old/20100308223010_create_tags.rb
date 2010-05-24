class CreateTags < ActiveRecord::Migration
  def self.up
    create_table :tags do |t|
      t.string :taggable_type
      t.integer :taggable_id
      t.timestamps
    end
  end
  
  def self.down
    drop_table :tags
  end
end
