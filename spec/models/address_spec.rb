require 'rails_helper'
describe Address do
  describe '#create' do
    it "is valid with postal_code, city, street, prefecture" do
      address = build(:address, building_name: "", phone: "")
      expect(address).to be_valid
    end
    
    it "is invalid without a postal_code"  do
      address = build(:address, postal_code: "")
      address.valid?
      expect(address.errors[:postal_code]).to include("が入力されていません。")
    end

    it "is invalid without a prefecture"  do
      address = build(:address, prefecture: "")
      address.valid?
      expect(address.errors[:prefecture]).to include("が入力されていません。")
    end

    it "is invalid without a city"  do
      address = build(:address, city: "")
      address.valid?
      expect(address.errors[:city]).to include("が入力されていません。")
    end

    it "is invalid without a street"  do
      address = build(:address, street: "")
      address.valid?
      expect(address.errors[:street]).to include("が入力されていません。")
    end

    it "is invalid with a postal_code thas has less than 6 characters " do
      address = build(:address, postal_code: Faker::Number.number(digits: 6))
      address.valid?
      expect(address.errors[:postal_code]).to include("のフォーマットが不適切です")
    end

    it "is invalid with a postal_code thas has more than 8 characters " do
      address = build(:address, postal_code: Faker::Number.number(digits: 8))
      address.valid?
      expect(address.errors[:postal_code]).to include("のフォーマットが不適切です")
    end

    it "is invalid with a postal_code thas has other than numbers " do
      address = build(:address, postal_code: "abcdefg")
      address.valid?
      expect(address.errors[:postal_code]).to include("のフォーマットが不適切です")
    end
  end
  describe '#update' do
    it "is valid with empty other than prefecuture is default" do
      address = build(:address)
      address.save
      address.update(postal_code: "", prefecture: "---", city: "", street: "", building_name: "", phone: "")
      expect(address).to be_valid
    end
    
    it "is invalid with a postal_code thas has less than 6 characters " do
      address = build(:address)
      address.update(postal_code: Faker::Number.number(digits: 6))
      expect(address.errors[:postal_code]).to include("のフォーマットが不適切です")
    end

    it "is invalid with a postal_code thas has more than 8 characters " do
      address = build(:address)
      address.update(postal_code: Faker::Number.number(digits: 8))
      expect(address.errors[:postal_code]).to include("のフォーマットが不適切です")
    end

    it "is invalid with a postal_code thas has other than numbers " do
      address = build(:address)
      address.update(postal_code: "abcdefg")
      expect(address.errors[:postal_code]).to include("のフォーマットが不適切です")
    end
  end
end