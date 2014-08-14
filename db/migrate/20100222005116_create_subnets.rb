class CreateSubnets < ActiveRecord::Migration
  def self.up
    create_table :subnets do |t|
      t.int :collection_id
      t.column :network_address, :cidr
      t.column :subnet_mask, :cidr
      t.column :network_class, :cidr
      t.string :description
      t.string :note
      t.string :updated_by
      t.int :parent_id

      t.timestamps
    end
  end

  def self.down
    drop_table :subnets
  end
end
