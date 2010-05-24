class CreateInstruments < ActiveRecord::Migration
  def self.up
    create_table :instruments do |t|
      t.integer :user_id
      t.timestamps
    end
  end
  
  def self.down
    drop_table :instruments
  end
end
