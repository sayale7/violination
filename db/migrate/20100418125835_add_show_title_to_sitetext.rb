class AddShowTitleToSitetext < ActiveRecord::Migration
  def self.up
    add_column :sitetexts, :show_title, :boolean
  end

  def self.down
    remove_column :sitetexts, :show_title
  end
end
