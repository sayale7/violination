class AddTextableIdToSitetext < ActiveRecord::Migration
  def self.up
    add_column :sitetexts, :textable_id, :integer
  end

  def self.down
    remove_column :sitetexts, :textable_id
  end
end
