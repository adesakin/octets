class AddParentIdToSubnets < ActiveRecord::Migration
  def self.up
    add_column :subnets, :parent_id, :integer
  end

  def self.down
    remove_column :subnets, :parent_id
  end
end
