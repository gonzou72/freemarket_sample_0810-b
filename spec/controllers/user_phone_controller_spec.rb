require 'rails_helper'

describe Users::PhonesController do
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
end