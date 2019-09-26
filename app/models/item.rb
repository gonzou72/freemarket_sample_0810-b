class Item < ApplicationRecord
  belongs_to :user
  belongs_to :category
  has_many :images
  accepts_nested_attributes_for :images

  validates :name, :detail, :price, :size, :condition, :shipping_fee, :shipping_method, :ship_out_area, :ship_out_date,presence: true
  validates :name, length:{maximum:40,message:"商品名を入力してください"}  
  validate :image_save

  private
    def image_save
      if Image.ids.nil?
        errors.add("画像がありません")
      end
    end
  # has_many :comments
  # has_many :likes
  # has_one :status
  # has_one :buyer
end