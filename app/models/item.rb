class Item < ApplicationRecord
  belongs_to :user
  has_many :connections, dependent: :destroy
  has_many :detail_images, dependent: :destroy
  acts_as_taggable_on :tags
end
