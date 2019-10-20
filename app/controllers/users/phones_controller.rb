class Users::PhonesController < ApplicationController
  def index
    redirect_to users_addresses_path
  end
end
