class AddAlignToSitetext < ActiveRecord::Migration
  def self.up
    add_column :sitetexts, :align, :string
  end

  def self.down
    remove_column :sitetexts, :align
  end
end
