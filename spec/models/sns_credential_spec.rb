require 'rails_helper'
describe SnsCredential do
  describe '#create' do
    it "is valid with a provider, uid, user_id (google)" do
      sns_credential = build(:google)
      expect(sns_credential).to be_valid
    end

    it "is valid with a provider, uid, user_id (facebook)" do
      sns_credential = build(:facebook)
      expect(sns_credential).to be_valid
    end

    it "is invalid without a provider(google)"  do
      sns_credential = build(:google, provider: "")
      sns_credential.valid?
      expect(sns_credential.errors[:provider]).to include("が入力されていません。")
    end

    it "is invalid without a provider(facebook)"  do
      sns_credential = build(:facebook, provider: "")
      sns_credential.valid?
      expect(sns_credential.errors[:provider]).to include("が入力されていません。")
    end

    it "is invalid without a uid(google)"  do
      sns_credential = build(:google, uid: "")
      sns_credential.valid?
      expect(sns_credential.errors[:uid]).to include("が入力されていません。")
    end

    it "is invalid without a uid(facebook)"  do
      sns_credential = build(:facebook, uid: "")
      sns_credential.valid?
      expect(sns_credential.errors[:uid]).to include("が入力されていません。")
    end

    it "is invalid with a duplicate uid and provider (google)"  do
      sns_credential = create(:google)
      another_sns_credential = build(:google, uid: sns_credential.uid)
      another_sns_credential.valid?
      expect(another_sns_credential.errors[:uid]).to include("は既に使用されています。")
    end

    it "is invalid with a duplicate uid and provider (facebook)"  do
      sns_credential = create(:facebook)
      another_sns_credential = build(:facebook, uid: sns_credential.uid)
      another_sns_credential.valid?
      expect(another_sns_credential.errors[:uid]).to include("は既に使用されています。")
    end

    it "is valid if same uid but dirrent provider"  do
      sns_credential = create(:google)
      another_sns_credential = build(:facebook, uid: sns_credential.uid)
      another_sns_credential.valid?
      expect(another_sns_credential).to be_valid
    end
  end
end