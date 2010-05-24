class RemoveValueTypeFromTagValue < ActiveRecord::Migration
  def self.up
    remove_column :tag_values, :value_type
  end

  def self.down
    add_column :tag_values, :value_type, :string
  end
end
