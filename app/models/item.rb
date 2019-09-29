class Item < ApplicationRecord
  belongs_to :user
  belongs_to :category
  has_many :images
  accepts_nested_attributes_for :images
  has_one :buyer
  # has_many :comments
  # has_many :likes
  # has_many :categories, through: :item_categories
  # has_one :status
  # has_many :delivery_methods
  # mount_uploader :image, ImageUploader
end