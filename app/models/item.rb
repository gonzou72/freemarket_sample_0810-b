class Item < ApplicationRecord
  belongs_to :user
  belongs_to :category
  has_many :images
  accepts_nested_attributes_for :images
  has_one :buyer
  # has_one :card

  validates :name, :detail, :price, :size, :condition, :shipping_fee, :shipping_method, :ship_out_area, :ship_out_date ,presence: true
  validates :name, length: {maximum: 40}
  validate  :image_save,on:[:new, :create]

  def image_save
    errors.add(:image, "fffffff") if images.empty?
  end

  # has_many :comments
  # has_many :likes
  # has_one :status
  # has_many :delivery_methods

end