class AddUserIdToBow < ActiveRecord::Migration
  def self.up
    add_column :bows, :user_id, :integer
  end

  def self.down
    remove_column :bows, :user_id
  end
end
