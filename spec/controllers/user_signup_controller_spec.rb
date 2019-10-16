require 'rails_helper'

describe Users::SignupController do
  describe "#index" do
    context 'not login' do
      before do
        @request.env["devise.mapping"] = Devise.mappings[:user]
        get :index
      end
      
      it 'renders the :index template' do
        expect(response).to render_template :index
      end
    end
  end

  describe "#new" do
    context 'not login' do
      before do
        @request.env["devise.mapping"] = Devise.mappings[:user]
        get :new
      end

      it 'renders the :new template' do
        expect(response).to render_template :new
      end
    end
  end
  describe "#create" do
    context 'pass validation' do
      before do
        @request.env["devise.mapping"] = Devise.mappings[:user]
      end
      
      let(:params) do
        { user: 
          { nickname: Faker::Name.last_name, 
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
      end
      subject { post :create, params: params }

      it 'redirect to users_phones_path' do
        subject
        expect(response).to redirect_to(users_phones_path)
      end
    end

    context 'not pass validation' do
      before do
        @request.env["devise.mapping"] = Devise.mappings[:user]
      end
      
      let(:params) do
        { user: 
          { nickname: Faker::Name.last_name, 
            email: Faker::Internet.free_email,
          }
        }
      end
      subject { post :create, params: params }

      it 'renders devise/registrations/new' do
        subject
        expect(response).to render_template 'devise/registrations/new'
      end
    end
  end
end