class AddAncestryToSubnet < ActiveRecord::Migration
  def self.up
    add_column :subnets, :ancestry, :string
    add_index :subnets, :ancestry
  end

  def self.down
    remove_column :subnets, :ancestry
    remove_index :subnets, :ancestry
  end
end
