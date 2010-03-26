class AddInstrumentKindToInstrument < ActiveRecord::Migration
  def self.up
    add_column :instruments, :instrument_kind, :string
  end

  def self.down
    remove_column :instruments, :instrument_kind
  end
end
