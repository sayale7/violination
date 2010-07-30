class AddSearchablesToTag < ActiveRecord::Migration
  def self.up
    add_column :tags, :searchables, :text
  end

  def self.down
    remove_column :tags, :searchables
  end
end
