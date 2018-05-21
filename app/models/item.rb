class Item < ApplicationRecord
  belongs_to :user
  has_many :connections
  has_many :detail_images
  mount_uploader :cover_image, CoverImageUploader
end
