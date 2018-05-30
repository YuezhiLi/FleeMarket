class User < ApplicationRecord
  has_many :items, dependent: :destroy
  # has_many :favorites, dependent: :destroy
  # has_many :favorite_items, through: :favorites, source: :item
  has_one :inbox
  has_many :received_messages, through: :inbox, source: :messages
  has_many :sent_messages, class_name: :Message, foreign_key: :user_id
  # validates :authorization_token, length: { is: 32 }
end
