class RemoveParentIdFromSitetext < ActiveRecord::Migration
  def self.up
    remove_column :sitetexts, :parent_id
  end

  def self.down
    add_column :sitetexts, :parent_id, :integer
  end
end
