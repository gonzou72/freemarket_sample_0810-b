require 'rails_helper'

describe ProfilesController do
  let(:user) { create(:user) }

  describe "#edit" do
    context 'log in' do
      before do
        login user
        get :edit, params: { id: user.id }
      end
      it 'renders the :edit template' do
        expect(response).to render_template :edit
      end
    end

    context 'not log in' do
      before do
        get :edit, params: { id: user.id }
      end
      it 'redirects to new_user_session_path' do
        expect(response).to redirect_to(new_user_session_path)
      end
    end
  end
end