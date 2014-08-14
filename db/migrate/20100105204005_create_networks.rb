class CreateNetworks < ActiveRecord::Migration
  def self.up
    create_table :networks do |t|
      t.integer :collection_id
      t.column :network_address, :cidr
      t.column :subnet_mask, :inet
      t.integer :network_class
      t.string :description
      t.text :note
      t.string :updated_by

      t.timestamps
    end
  end

  def self.down
    drop_table :networks
  end
end
