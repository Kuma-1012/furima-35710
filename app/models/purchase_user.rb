class PurchaseUser < ApplicationRecord
  belongs_to :user
  belongs_to :item
  has_many :addresses
end
