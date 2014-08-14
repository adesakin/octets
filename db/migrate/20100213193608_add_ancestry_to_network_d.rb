class AddAncestryToNetworkD < ActiveRecord::Migration
  def self.up
    add_column :network_ds, :ancestry, :string
    add_index :network_ds, :ancestry
  end

  def self.down
    remove_column :network_ds, :ancestry
    remove_index :network_ds, :ancestry
  end
end
