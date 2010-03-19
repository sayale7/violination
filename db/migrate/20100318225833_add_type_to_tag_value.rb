class AddTypeToTagValue < ActiveRecord::Migration
  def self.up
    add_column :tag_values, :type, :string
  end

  def self.down
    remove_column :tag_values, :type
  end
end
