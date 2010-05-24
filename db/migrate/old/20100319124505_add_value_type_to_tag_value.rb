class AddValueTypeToTagValue < ActiveRecord::Migration
  def self.up
    add_column :tag_values, :value_type, :string
  end

  def self.down
    remove_column :tag_values, :value_type
  end
end
