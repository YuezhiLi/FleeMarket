class Message < ApplicationRecord
  belongs_to :inbox
  belongs_to :user
  belongs_to :item
end
