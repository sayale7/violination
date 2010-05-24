class AddValueTypeToTag < ActiveRecord::Migration
  def self.up
    add_column :tags, :value_type, :string
  end

  def self.down
    remove_column :tags, :value_type
  end
end
