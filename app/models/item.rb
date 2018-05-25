class Item < ApplicationRecord
  belongs_to :user
  has_many :connections
  has_many :detail_images
  acts_as_taggable_on :tags
end
