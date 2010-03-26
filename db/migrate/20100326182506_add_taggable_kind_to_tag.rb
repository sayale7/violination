class AddTaggableKindToTag < ActiveRecord::Migration
  def self.up
    add_column :tags, :taggable_kind, :string
  end

  def self.down
    remove_column :tags, :taggable_kind
  end
end
