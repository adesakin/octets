class CreateNetworkDs < ActiveRecord::Migration
  def self.up
    create_table :network_ds do |t|
      t.column :network_address, :cidr
      t.string :description
      t.string :updated_by

      t.timestamps
    end
  end

  def self.down
    drop_table :network_ds
  end
end
