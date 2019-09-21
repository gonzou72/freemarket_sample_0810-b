require 'rails_helper'
describe User do
  describe '#create' do
    it "is valid with a nickname, email, password, password_confirmation, last_name, first_name, last_name_kana, first_name_kana, birth_day" do
      user = build(:user)
      expect(user).to be_valid
    end

    it "is invalid without a nickname"  do
      user = build(:user, nickname: "")
      user.valid?
      expect(user.errors[:nickname]).to include("が入力されていません。")
    end

    it "is invalid without a email"  do
      user = build(:user, email: "")
      user.valid?
      expect(user.errors[:email]).to include("が入力されていません。")
    end

    it "is invalid without a password"  do
      user = build(:user, password: "")
      user.valid?
      expect(user.errors[:password]).to include("が入力されていません。")
    end

    it "is invalid without a last_name"  do
      user = build(:user, last_name: "")
      user.valid?
      expect(user.errors[:last_name]).to include("が入力されていません。")
    end

    it "is invalid without a first_name"  do
      user = build(:user, first_name: "")
      user.valid?
      expect(user.errors[:first_name]).to include("が入力されていません。")
    end

    it "is invalid without a last_name_kana"  do
      user = build(:user, last_name_kana: "")
      user.valid?
      expect(user.errors[:last_name_kana]).to include("が入力されていません。")
    end

    it "is invalid without a first_name_kana"  do
      user = build(:user, first_name_kana: "")
      user.valid?
      expect(user.errors[:first_name_kana]).to include("が入力されていません。")
    end

    it "is invalid without a birth_day"  do
      user = build(:user, birth_day: "")
      user.valid?
      expect(user.errors[:birth_day]).to include("が入力されていません。")
    end

    it "is invalid without a password_confirmation although with a password"  do
      user = build(:user, password_confirmation: "")
      user.valid?
      expect(user.errors[:password_confirmation]).to include("が異なります。")
    end

    it "is invalid with a duplicate nickname"  do
      user = create(:user)
      another_user = build(:user, nickname:user.nickname)
      another_user.valid?
      expect(another_user.errors[:nickname]).to include("は既に使用されています。")
    end

    it "is invalid with a duplicate email"  do
      user = create(:user)
      another_user = build(:user, email:user.email)
      another_user.valid?
      expect(another_user.errors[:email]).to include("は既に使用されています。")
    end

    it "is valid with a password thas has more than 7 characters " do
      user = build(:user, password: "0000000", password_confirmation: "0000000")
      user.valid?
      expect(user).to be_valid
    end

    it "is invalid with a password thas has less than 6 characters " do
      user = build(:user, password: "000000", password_confirmation: "000000")
      user.valid?
      expect(user.errors[:password][0]).to include("は7文字以上に設定して下さい。")
    end

    it "is invalid other than double-byte characters is included in last_name"  do
      user = build(:user, last_name: "あいうえお愛ueお")
      user.valid?
      expect(user.errors[:last_name]).to include("を全角で入力して下さい。")
    end

    it "is invalid other than double-byte characters is included in first_name"  do
      user = build(:user, first_name: "かきくけこ牡蠣くけ5")
      user.valid?
      expect(user.errors[:first_name]).to include("を全角で入力して下さい。")
    end

    it "is invalid other than double-byte katakana characters is included in last_name_kana"  do
      user = build(:user, last_name_kana: "アイウエo愛ueお")
      user.valid?
      expect(user.errors[:last_name_kana]).to include("を全角カタカナで入力して下さい。")
    end

    it "is invalid other than double-byte katakana characters is included in first_name_kana"  do
      user = build(:user, first_name_kana: "アイウエオ牡蠣くけ5")
      user.valid?
      expect(user.errors[:first_name_kana]).to include("を全角カタカナで入力して下さい。")
    end
  end
end