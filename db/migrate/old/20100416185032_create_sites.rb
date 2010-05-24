class CreateSites < ActiveRecord::Migration
  def self.up
    create_table :sites do |t|
      t.string :title
      t.string :sitable_type
      t.integer :parent_id
      t.boolean :active
      t.integer :position
      t.timestamps
    end
  end
  
  def self.down
    drop_table :sites
  end
end
