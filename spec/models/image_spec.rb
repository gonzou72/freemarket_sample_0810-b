require 'rails_helper'
describe Image do
  describe '#create' do
    it "is invalid without image" do
    image = build(:image, image:"")
    image.valid?
    expect(image.errors[:image]).to include ("が入力されていません。")
    end
  end
end
