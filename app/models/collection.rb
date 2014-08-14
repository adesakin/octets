class Collection < ActiveRecord::Base
  acts_as_tree
  has_many :collection_attributes
  has_many :networks
end
