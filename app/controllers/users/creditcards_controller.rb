class Users::CreditcardsController < ApplicationController
  require "payjp"
  def index
    @user = User.new(session[:received_form]["user"])
  end
end
