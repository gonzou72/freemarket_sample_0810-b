require 'rails_helper'

describe CardsController do
  let(:user) { create(:user) }

  describe "#new" do
    context 'log in' do
      before do
        login user
        get :new
      end
      it 'renders the :new template' do
        expect(response).to render_template :new
      end
    end

    context 'not log in' do
      before do
        get :new
      end
      it 'redirects to new_user_session_path' do
        expect(response).to redirect_to(new_user_session_path)
      end
    end
  end
end