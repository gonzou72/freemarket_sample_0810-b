require 'rails_helper'

describe MypagesController do
  let(:user) { create(:user) }

  describe "#index" do
    context 'log in' do
      before do
        login user
        get :index
      end
      it 'renders the :index template' do
        expect(response).to render_template :index
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

  describe "#destroy" do
    context 'log in' do
      before do
        login user
        delete :destroy, params: { id: user.id }
      end
      it 'renders the :destroy template' do
        expect(response).to render_template :destroy
      end
    end

    context 'not log in' do
      before do
        delete :destroy, params: { id: user.id } 
      end
      it 'redirects to new_user_session_path' do
        expect(response).to redirect_to(new_user_session_path)
      end
    end
  end
end