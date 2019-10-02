class IdentificationsController < ApplicationController
  before_action :authenticate_user!, only: [:index, :create, :update]
  before_action :address_existence, only: [:index, :update]
  def index
    if @address.present?
      @path = identification_path(@address)
    else
      @address = Address.new
      @path = identifications_path
    end
  end

  def create
    @address = Address.new(address_params)
    if @address.save
      redirect_to identifications_path, notice: '本人情報を登録しました'
    else
      @path = identifications_path(@address)
      render 'identifications/index'
    end
  end

  def update
    if @address.update(address_params)
      redirect_to identifications_path, notice: '本人情報を更新しました'
    else
      @path = identification_path(@address)
      render 'identifications/index'
    end
  end

  private
  def address_existence
    @address = current_user.address
  end

  def address_params
    params.require(:address).permit(:user_id, :postal_code, :prefecture, :city, :street, :building_name, :phone)
  end
end
