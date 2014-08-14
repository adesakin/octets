class AddAncestryToCollections < ActiveRecord::Migration
  def self.up
    add_column :collections, :ancestry, :string
    add_index :collections, :ancestry
  end

  def self.down
    remove_column :collections, :ancestry
    remove_index :collections, :ancestry
  end
end
