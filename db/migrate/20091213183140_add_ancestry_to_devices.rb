class AddAncestryToDevices < ActiveRecord::Migration
  def self.up
    add_column :devices, :ancestry, :string
    add_index :devices, :ancestry
  end

  def self.down
    remove_column :devices, :ancestry
    remove_index :devices, :ancestry
  end
end
