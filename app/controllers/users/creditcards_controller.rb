class Users::CreditcardsController < ApplicationController
  def index
    @user = User.new(session[:received_form]["user"])
  end
end
