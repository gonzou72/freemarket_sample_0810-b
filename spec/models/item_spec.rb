require 'rails_helper'
describe Item do
  describe '#create' do

    it "is invalid without name" do
      item = build(:item,name:"")
      item.valid?
      expect(item.errors[:name]).to include("が入力されていません。")
    end
    it "is invalid more than 40charcters is include in name" do
      item = build(:item,name:"あああああああああああああああああああああああああああああああああああああああああ")
      item.valid?
      expect(item.errors[:name]).to include("は40文字以下に設定して下さい。")
    end
    it "is invalid without detail" do
      item = build(:item,detail:"")
      item.valid?
      expect(item.errors[:detail]).to include("が入力されていません。")
    end
    it "is invalid without price" do
      item = build(:item,price:"")
      item.valid?
      expect(item.errors[:price]).to include("が入力されていません。")
    end
    it "is invalid without size" do
      item = build(:item,size:"")
      item.valid?
      expect(item.errors[:size]).to include("が入力されていません。")
    end
    it "is invalid without category_id" do
      item = build(:item,category_id:"")
      item.valid?
      expect(item.errors[:category_id]).to include("が入力されていません。")
    end
    it "is invalid without condition" do
      item = build(:item,condition:"")
      item.valid?
      expect(item.errors[:condition]).to include("が入力されていません。")
    end
    it "is invalid without shipping_fee" do
      item = build(:item,shipping_fee:"")
      item.valid?
      expect(item.errors[:shipping_fee]).to include("が入力されていません。")
    end
    it "is invalid without shipping_method" do
      item = build(:item,shipping_method:"")
      item.valid?
      expect(item.errors[:shipping_method]).to include("が入力されていません。")
    end
    it "is invalid without ship_out_area" do
      item = build(:item,ship_out_area:"")
      item.valid?
      expect(item.errors[:ship_out_area]).to include("が入力されていません。")
    end
    it "is invalid without ship_out_date" do
      item = build(:item,ship_out_date:"")
      item.valid?
      expect(item.errors[:ship_out_date]).to include("が入力されていません。")
    end
  end
end