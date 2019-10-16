require 'rails_helper'

describe Users::RegistrationsController do
  let(:user) { create(:user) }
  describe "#new" do
    before do
      @request.env["devise.mapping"] = Devise.mappings[:user]
      get :new
    end

    it 'renders the :new template' do
      expect(response).to render_template :new
    end
  end
  
  describe "#create" do
    context 'can save' do
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
      subject { post :create, params: params }
      
      it 'count up user' do
        expect{ subject }.to change(User, :count).by(1)
      end
    end
  end

  describe "#update" do
    context 'can save' do 
      before do
        @request.env["devise.mapping"] = Devise.mappings[:user]
        login user
      end
      let(:params) do
        { user: 
          { profile_text: "text", 
            nickname: "nickname"
          },
          id: user.id
        }
      end
      subject { patch :update, params: params}

      it 'update column' do
        subject
        expect(user.reload.nickname).to eq "nickname"
      end

      it 'redirects to edit_profile_path' do
        subject
        expect(response).to redirect_to(edit_profile_path(user.id))
      end
    end

    context 'can not save' do
      before do
        @request.env["devise.mapping"] = Devise.mappings[:user]
        login user
      end
      let(:params) do
        { user: 
          { profile_text: "text", 
            nickname: ""
          },
          id: user.id
        }
      end
      subject { patch :update, params: params}

      it 'not update column' do
        subject
        expect(user.reload.nickname).not_to eq ""
      end

      it 'renders the profiles/edit template' do
        subject
        expect(response).to render_template "profiles/edit"
      end
      
    end
  end
end