class CreateRequests < ActiveRecord::Migration
  def self.up
    create_table :requests do |t|
      t.string :name
      t.string :email
      t.timestamps
    end
  end
  
  def self.down
    drop_table :requests
  end
end
