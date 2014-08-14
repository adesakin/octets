class AddAncestryToNetworks < ActiveRecord::Migration
  def self.up
    add_column :networks, :ancestry, :string
    add_index :networks, :ancestry
  end

  def self.down
    remove_column :networks, :ancestry
    remove_index :networks, :ancestry
  end
end
