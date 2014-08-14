class CreateCollections < ActiveRecord::Migration
  def self.up
    create_table :collections do |t|
      t.integer :parent_id
      t.string :id_path
      t.integer :children_count
      t.integer :family_id
      t.integer :level
      t.string :name
      t.string :description
      t.text :notes
      t.string :updated_by

      t.timestamps
    end
  end

  def self.down
    drop_table :collections
  end
end
