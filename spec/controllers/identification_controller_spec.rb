require 'rails_helper'

describe IdentificationsController do
  let(:user) { create(:user) }

  describe "#index" do
    context 'log in' do
      before do
        login user
        get :index
      end

      context 'address existence' do
        let(:user_address) { create(:address, user_id: user.id) }
        it 'renders the :index template' do
          expect(response).to render_template :index
        end
      end

      context 'address not existence' do
        it 'assigns @address' do
          expect(assigns(:address)).to be_a_new(Address)
        end
        it 'renders the :index template' do
          expect(response).to render_template :index
        end
      end
    end

    context 'not log in' do
      before do
        get :index
      end

      it 'redirects to new_user_session_path' do
        expect(response).to redirect_to(new_user_session_path)
      end
    end
  end

  describe "#create" do
    context 'log in' do
      before do
        login user
      end
      
      context 'can save' do
        let(:params) do
          { address: 
            { user_id: user.id, 
              postal_code: Faker::Number.number(digits: 7), 
              prefecture: Gimei.prefecture.kanji , 
              city: Gimei.city.kanji, 
              street: Gimei.town.kanji, 
              building_name: Gimei.last.kanji, 
              phone: Faker::Number.number(digits: 11)
            }
          }
        end
        subject { post :create, params: params }

        it 'count up address' do
          expect{ subject }.to change(Address, :count).by(1)
        end
        
        it 'redirects to identifications_path' do
          subject
          expect(response).to redirect_to(identifications_path)
        end
      end
      context 'can not save' do
        let(:invalid_params) do
            { address: 
              { user_id: user.id, 
                postal_code: "12345678", 
                prefecture: Gimei.prefecture.kanji , 
                city: Gimei.city.kanji, 
                street: Gimei.town.kanji, 
                building_name: Gimei.last.kanji, 
                phone: Faker::Number.number(digits: 11)
              }
            }
        end
        subject { post :create, params: invalid_params }

        it 'not count up address' do
          expect{ subject }.to change(Address, :count).by(0)
        end

        it 'renders index' do
          subject
          expect(response).to render_template :index
        end
      end
    end

    context 'not log in' do
      before do
        post :create
      end
      it 'redirects to new_user_session_path' do
        expect(response).to redirect_to(new_user_session_path)
      end
    end
  end

  describe "#update" do
    let(:address) { create(:address, user_id: user.id)}
    context 'log in' do
      before do
        login user
      end

      context 'can update' do
        let(:params) do
          { address: 
            { user_id: address.user_id, 
              postal_code: "7777777", 
              prefecture: address.prefecture, 
              city: address.city, 
              street: address.street, 
              building_name: address.building_name, 
              phone: address.phone,
            },
            id: address.id
          }
        end
        subject { patch :update, params: params}

        it 'update column' do
          subject
          expect(address.reload.postal_code).to eq "7777777"
        end

        it 'redirects to identifications_path' do
          subject
          expect(response).to redirect_to(identifications_path)
        end
      end

      context 'can not update' do
        let(:params) do
          { address: 
            { user_id: address.user_id, 
              postal_code: "88888888", 
              prefecture: address.prefecture, 
              city: address.city, 
              street: address.street, 
              building_name: address.building_name, 
              phone: address.phone,
            },
            id: address.id
          }
        end
        subject { patch :update, params: params}

        it 'not update column' do
          subject
          expect(address.reload.postal_code).not_to eq "88888888"
        end

        it 'renders the :edit template' do
          subject
          expect(response).to render_template :index
        end
      end
    end

    context 'not log in' do
      before do
        patch :update, params: { id: address.id }
      end
      it 'redirects to new_user_session_path' do
        expect(response).to redirect_to(new_user_session_path)
      end
    end
  end
end