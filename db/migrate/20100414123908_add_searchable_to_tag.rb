class AddSearchableToTag < ActiveRecord::Migration
  def self.up
    add_column :tags, :searchable, :boolean
  end

  def self.down
    remove_column :tags, :searchable
  end
end
