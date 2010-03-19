class RemoveFreeTextFromTag < ActiveRecord::Migration
  def self.up
    remove_column :tags, :free_text
  end

  def self.down
    add_column :tags, :free_text, :text
  end
end
