class Image < ApplicationRecord
  belongs_to :item,optional: true

  def self.create_photo(item_params)
    return false if item_params[:image].nil?
    Image.transaction do
      item_params[:image].each do |image|
        new_image = Image.new(content: image)
        return false unless new_image.save!
      end
    end
    true
  end
end
