class CreateTagValues < ActiveRecord::Migration
  def self.up
    create_table :tag_values do |t|
      t.integer :tag_id
      t.integer :taggable_id
      t.string :taggable_type
      t.string :language
      t.string :value

      t.timestamps
    end
  end

  def self.down
    drop_table :tag_values
  end
end
