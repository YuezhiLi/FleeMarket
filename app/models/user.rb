class User < ApplicationRecord
  has_many :items
  has_many :connections
  has_many :wanted_items, through: :connections, source: :item
  validates :authorization_token, length: { is: 32 }
end
