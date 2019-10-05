class Users::AddressesController < Devise::RegistrationsController
  def index
    @user = User.new(session[:received_form]["user"])
    @user.build_address
  end

  def create
    build_resource(sign_up_params)
    if resource.valid?
      session[:received_form] = params
      redirect_to users_creditcards_path(resource)
    else
      render 'users/addresses/index'
    end
  end
end
