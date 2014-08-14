class CreateNetworkAllocations < ActiveRecord::Migration
  def self.up
    create_table :network_allocations do |t|
      t.integer :collection_id
      t.cidr :network_address

      t.timestamps
    end
  end

  def self.down
    drop_table :network_allocations
  end
end
