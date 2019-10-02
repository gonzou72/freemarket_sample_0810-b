class Users::SignupController < Devise::RegistrationsController

  def index
  end

  def new
  end
  
  def create
    build_resource(sign_up_params)
    if resource.valid?
      session[:received_form] = params
      redirect_to users_phones_path(resource)
    else
      render 'devise/registrations/new'
    end
  end
end