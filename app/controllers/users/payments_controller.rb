class Users::PaymentsController < ApplicationController
  def new
  end

  def create
    render 'users/payments/complete'
  end
end
