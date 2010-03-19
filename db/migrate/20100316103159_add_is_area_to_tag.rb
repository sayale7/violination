class AddIsAreaToTag < ActiveRecord::Migration
  def self.up
    add_column :tags, :is_area, :boolean
  end

  def self.down
    remove_column :tags, :is_area
  end
end
