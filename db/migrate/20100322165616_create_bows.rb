class CreateBows < ActiveRecord::Migration
  def self.up
    create_table :bows do |t|

      t.timestamps
    end
  end

  def self.down
    drop_table :bows
  end
end
