class User < ApplicationRecord
  has_many :items
  has_many :connections
  has_many :wanted_items, through: :connections, source: :item
  validates :email, format: { with: /.+@.+\..+/ }
  validates :phone_number, format: { with: /\d+/ }
  # validates :authorization_token, length: { is: 32 }
end
