class CreateTagNames < ActiveRecord::Migration
  def self.up
    create_table :tag_names do |t|
      t.integer :tag_id
      t.string :value
      t.string :language
      t.timestamps
    end
  end
  
  def self.down
    drop_table :tag_names
  end
end
