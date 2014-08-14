class CreateCollectionAttributes < ActiveRecord::Migration
  def self.up
    create_table :collection_attributes do |t|
      t.integer :collection_id
      t.string :attribute1
      t.string :attribute2
      t.string :attribute3
      t.string :attribute4
      t.string :street
      t.string :city
      t.string :postcode
      t.string :status

      t.timestamps
    end
  end

  def self.down
    drop_table :collection_attributes
  end
end
