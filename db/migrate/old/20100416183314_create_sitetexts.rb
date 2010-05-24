class CreateSitetexts < ActiveRecord::Migration
  def self.up
    create_table :sitetexts do |t|
      t.string :title
      t.text :content
      t.string :textable_type
      t.integer :parent_id
      t.boolean :active
      t.boolean :archive
      t.timestamps
    end
  end
  
  def self.down
    drop_table :sitetexts
  end
end
