require 'rails_helper'

describe Users::OmniauthCallbacksController do
  describe "#google_oauth2_to_callback_for" do
    before do
      @request.env["devise.mapping"] = Devise.mappings[:user]
      request.env["omniauth.auth"] = OmniAuth::AuthHash.new({"provider" => "google_oauth2", "uid" => "123456"})
    end
    subject { get :google_oauth2}
    context "sns_credential not present" do
      it 'redirect_to new_user_registration_path' do
        expect(subject).to redirect_to new_user_registration_path
      end
    end
    context "sns_credential present" do
      it 'redirect_to root_path & sighin' do
          sns_credential = create(:google ,uid: "123456")
          expect(subject).to redirect_to root_path
      end
    end
  end
  
  describe "#facebook_to_callback_for" do
    before do
      @request.env["devise.mapping"] = Devise.mappings[:user]
      request.env["omniauth.auth"] = OmniAuth::AuthHash.new({"provider" => "facebook", "uid" => "123456"})
    end
    subject { get :facebook}
    context "sns_credential not present" do
      it 'redirect_to new_user_registration_path' do
        expect(subject).to redirect_to new_user_registration_path
      end
    end
    context "sns_credential present" do
      it 'redirect_to root_path & sighin' do
          sns_credential = create(:facebook ,uid: "123456")
          expect(subject).to redirect_to root_path
      end
    end
  end
  describe "#failure" do
    before do
      @request.env["devise.mapping"] = Devise.mappings[:user]
      request.env["omniauth.auth"] = OmniAuth::AuthHash.new({"provider" => nil, "uid" => nil})
    end

    subject { get :facebook}
    context "omniauth parameter not present" do
      it 'redirect_to root_path' do
        expect(subject).to redirect_to root_path
      end
    end
  end
end