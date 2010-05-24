class CreateSitenames < ActiveRecord::Migration
  def self.up
    create_table :sitenames do |t|
      t.integer :site_id
      t.string :value
      t.string :language

      t.timestamps
    end
  end

  def self.down
    drop_table :sitenames
  end
end
