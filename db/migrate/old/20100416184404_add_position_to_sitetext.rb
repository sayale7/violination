class AddPositionToSitetext < ActiveRecord::Migration
  def self.up
    add_column :sitetexts, :position, :integer
  end

  def self.down
    remove_column :sitetexts, :position
  end
end
