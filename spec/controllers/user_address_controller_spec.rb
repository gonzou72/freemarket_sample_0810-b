require 'rails_helper'

describe Users::AddressesController do
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

  describe "#create" do
    context 'not login' do
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
          },
          address: 
            { postal_code: Faker::Number.number(digits: 7), 
              prefecture: Gimei.prefecture.kanji , 
              city: Gimei.city.kanji, 
              street: Gimei.town.kanji, 
              building_name: Gimei.last.kanji, 
              phone: Faker::Number.number(digits: 11)
            }
        }
      end
      let(:invalid_params) do
        { user: 
          { nickname: Faker::Name.last_name, 
            birth_day: "19450111"
          },
          address: 
            { postal_code: "88888888", 
              phone: Faker::Number.number(digits: 11)
            }
        }
      end

      context 'pass validation' do
        subject { post :create, params: params }
        it 'redirect to users_phones_path' do
          subject
          expect(response).to redirect_to(users_creditcards_path)
        end
      end

      context 'not pass validation' do
        subject { post :create, params: invalid_params }
        it 'renders users/addresses/index' do
          subject
          expect(response).to render_template 'users/addresses/index'
        end
      end
    end
  end
end