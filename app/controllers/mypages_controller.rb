class MypagesController < ApplicationController
before_action :address_existence, only: [:identification, :identification_update]
  def index
  end

  def profile
  end

  def identification
    if @address.present?
      @path = identification_update_mypages_path(@address)
    else
      @address = Address.new
      @path = identification_create_mypages_path
    end
  end

  def identification_create
    @address = Address.new(address_params)
    if @address.save
      redirect_to identification_mypages_path, notice: '本人情報を登録しました'
    else
      @path = identification_create_mypages_path(@address)
      render 'mypages/identification'
    end
  end

  def identification_update
    if @address.update(address_params)
      redirect_to identification_mypages_path, notice: '本人情報を更新しました'
    else
      @path = identification_update_mypages_path(@address)
      render 'mypages/identification'
    end
  end

  private
  def address_existence
    @address = current_user.address.first
  end

  def address_params
    params.require(:address).permit(:user_id, :postal_code, :prefecture, :city, :street, :building_name, :phone)
  end
end
