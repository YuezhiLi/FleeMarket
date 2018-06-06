class Item < ApplicationRecord
  belongs_to :user
  has_many :favorites, dependent: :destroy
  has_many :detail_images, dependent: :destroy
  has_many :messages, dependent: :destroy
  has_many :reports, dependent: :destroy
  acts_as_taggable_on :tags
end
