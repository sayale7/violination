class AddFreeTextToTag < ActiveRecord::Migration
  def self.up
    add_column :tags, :free_text, :text
  end

  def self.down
    remove_column :tags, :free_text
  end
end
