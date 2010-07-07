class AddImportantTagToTag < ActiveRecord::Migration
  def self.up
    add_column :tags, :important_tag, :integer
  end

  def self.down
    remove_column :tags, :important_tag
  end
end
