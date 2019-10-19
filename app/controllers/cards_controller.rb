class CardsController < ApplicationController
  before_action :authenticate_user!, only: [:index, :new]
  
  require "payjp"
  
  def new
     @card = Card.where(user_id: current_user.id)
    if @card.exists?
      @cards = Card.find_by(user_id:current_user.id)
      redirect_to card_path(@cards)
    end
  end

  def pay
    Payjp.api_key = ENV["PAYJP_PRIVATE_KEY"]
    if params['payjp-token'].blank?
      redirect_to action: "new"
    else
      customer = Payjp::Customer.create(
        card: params['payjp-token']
      )
      @card = Card.new(user_id: current_user.id,customer_id: customer.id,card_id: customer.default_card)
      if @card.save
        redirect_to card_path(@card.id)
      else
        redirect_to action: "pay"
      end
    end
  end

  def delete
    card = Card.where(user_id: current_user.id).first
    if card.blank?
    else
      Payjp.api_key = ENV["PAYJP_PRIVATE_KEY"]
      customer = Payjp::Customer.retrieve(card.customer_id)
      customer.delete
      card.delete
    end
    redirect_to controller: :cards, action: :new
  end

  def show
    card = Card.where(user_id: current_user.id).first
    if card.blank?
      redirect_to action:"new"
    else
      Payjp.api_key = ENV["PAYJP_PRIVATE_KEY"]
      customer = Payjp::Customer.retrieve(card.customer_id)
      @default_card_information = customer.cards.retrieve(card.card_id)
    end
  end
end
