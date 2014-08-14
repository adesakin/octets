class AddParentIdToNetworks < ActiveRecord::Migration
  def self.up
    add_column :networks, :parent_id, :integer
  end

  def self.down
    remove_column :networks, :parent_id
  end
end
