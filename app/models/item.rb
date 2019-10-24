class Item < ApplicationRecord
  belongs_to :user
  belongs_to :category
  has_many :images, dependent: :destroy
  accepts_nested_attributes_for :images
  has_one :buyer

  validates :name, :detail, :price, :category_id,:condition, :shipping_fee, :shipping_method, :ship_out_area, :ship_out_date ,presence: true
  validates :name, length: {maximum: 40}
  validates :size, presence: true, if: :size_exist?
  validate  :image_save,on:[:new, :create]

  def image_save
    errors.add(:image, "") if images.empty?
  end

  def size_exist?
    category_id.to_i < 577
  end
  # has_many :comments
  # has_many :likes
  # has_one :status
  # has_many :delivery_methods

end