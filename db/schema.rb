# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20100223182651) do

  create_table "collection_attributes", :force => true do |t|
    t.integer  "collection_id"
    t.string   "attribute1"
    t.string   "attribute2"
    t.string   "attribute3"
    t.string   "attribute4"
    t.string   "street"
    t.string   "city"
    t.string   "postcode"
    t.string   "status"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "collections", :force => true do |t|
    t.integer  "parent_id"
    t.string   "id_path"
    t.integer  "children_count"
    t.integer  "family_id"
    t.integer  "level"
    t.string   "name"
    t.string   "description"
    t.text     "notes"
    t.string   "updated_by"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "ancestry"
  end

  add_index "collections", ["ancestry"], :name => "index_collections_on_ancestry"

  create_table "devices", :force => true do |t|
    t.integer  "parent_id"
    t.string   "id_path"
    t.integer  "children_count"
    t.integer  "family_id"
    t.integer  "level"
    t.string   "name"
    t.string   "description"
    t.text     "notes"
    t.string   "updated_by"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "ancestry"
  end

  add_index "devices", ["ancestry"], :name => "index_devices_on_ancestry"

  create_table "domains", :force => true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "network_allocations", :force => true do |t|
    t.integer  "collection_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "network_ds", :force => true do |t|
    t.string   "network_address", :limit => nil
    t.string   "description"
    t.string   "updated_by"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "ancestry"
  end

  add_index "network_ds", ["ancestry"], :name => "index_network_ds_on_ancestry"

  create_table "networks", :force => true do |t|
    t.integer  "collection_id"
    t.string   "network_address", :limit => nil
    t.string   "subnet_mask",     :limit => nil
    t.integer  "network_class"
    t.string   "description"
    t.text     "note"
    t.string   "updated_by"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "ancestry"
    t.integer  "parent_id"
  end

  add_index "networks", ["ancestry"], :name => "index_networks_on_ancestry"

  create_table "subnets", :force => true do |t|
    t.string   "network_address", :limit => nil
    t.string   "subnet_mask",     :limit => nil
    t.string   "network_class",   :limit => nil
    t.string   "description"
    t.string   "note"
    t.string   "updated_by"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "ancestry"
    t.integer  "parent_id"
  end

  add_index "subnets", ["ancestry"], :name => "index_subnets_on_ancestry"

  create_table "users", :force => true do |t|
    t.string   "login",                              :null => false
    t.string   "email",                              :null => false
    t.string   "crypted_password",                   :null => false
    t.string   "password_salt",                      :null => false
    t.string   "persistence_token",                  :null => false
    t.string   "single_access_token",                :null => false
    t.string   "perishable_token",                   :null => false
    t.integer  "login_count",         :default => 0, :null => false
    t.integer  "failed_login_count",  :default => 0, :null => false
    t.datetime "last_request_at"
    t.datetime "current_login_at"
    t.datetime "last_login_at"
    t.string   "current_login_ip"
    t.string   "last_login_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
