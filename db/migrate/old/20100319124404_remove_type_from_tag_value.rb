class RemoveTypeFromTagValue < ActiveRecord::Migration
  def self.up
    remove_column :tag_values, :type
  end

  def self.down
    add_column :tag_values, :type, :string
  end
end
