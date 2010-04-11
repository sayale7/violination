class AddVisibleToTag < ActiveRecord::Migration
  def self.up
    add_column :tags, :visible, :boolean
  end

  def self.down
    remove_column :tags, :visible
  end
end
