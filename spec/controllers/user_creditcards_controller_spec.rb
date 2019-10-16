require 'rails_helper'

describe Users::CreditcardsController do
  describe "#index" do
    context 'not login' do
      before do
        @request.env["devise.mapping"] = Devise.mappings[:user]

        session[:received_form] = {
          user: {
            nickname: Faker::Name.last_name, 
            email: Faker::Internet.free_email,
            password: "password",
            password_confirmation: "password",
            last_name: Gimei.last.kanji,
            first_name: Gimei.first.hiragana,
            last_name_kana: Gimei.last.katakana,
            first_name_kana: Gimei.first.katakana,
            birth_day: "20190415"
          }
        }
        get :index
      end

      it 'assigns @user' do
        expect(assigns(:user)).to be_a_new(User)
      end

      it 'renders the :index template' do
      expect(response).to render_template :index
      end
    end
  end
end