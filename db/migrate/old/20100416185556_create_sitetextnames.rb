class CreateSitetextnames < ActiveRecord::Migration
  def self.up
    create_table :sitetextnames do |t|
      t.integer :sitetext_id
      t.string :value
      t.string :language

      t.timestamps
    end
  end

  def self.down
    drop_table :sitetextnames
  end
end
