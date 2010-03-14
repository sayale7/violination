class RemoveTaggableIdFromTag < ActiveRecord::Migration
  def self.up
    remove_column :tags, :taggable_id
  end

  def self.down
    add_column :tags, :taggable_id, :integer
  end
end
