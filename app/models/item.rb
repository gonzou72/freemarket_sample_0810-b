class Item < ApplicationRecord
  belongs_to :user
  belongs_to :category
  # has_many :images
  # has_many :comments
  # has_many :likes
  # has_many :categories, through: :item_categories
  # has_one :status
  # has_many :delivery_methods
  # has_one :buyer
  # mount_uploader :image, ImageUploader
end