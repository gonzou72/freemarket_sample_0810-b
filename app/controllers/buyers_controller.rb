class BuyersController < ApplicationController

  require 'payjp'

  def index
    card = Card.where(user_id: current_user.id).first
    if card.blank?
      redirect_to controller: :cards, action: :new
    else
      Payjp.api_key = ENV["PAYJP_PRIVATE_KEY"]
      customer = Payjp::Customer.retrieve(card.customer_id)
      @default_card_information = customer.cards.retrieve(card.card_id)
    end
    session[:item_id] = params[:item_id]
    @items = Item.find(session[:item_id])
    @images = Image.find(params[:item_id])
  end

  def pay
    card = Card.where(user_id: current_user.id).first
    @items = Item.find(session[:item_id])
    Payjp.api_key = ENV['PAYJP_PRIVATE_KEY']
    Payjp::Charge.create(
      amount: @items.price,
      customer: card.customer_id,
      currency: 'jpy',
    )
    redirect_to action: "done"
  end

  def done
    @items = Item.find(session[:item_id])
    card = Card.where(user_id: current_user.id).last
    customer = Payjp::Customer.retrieve(card.customer_id)
    @default_card_information = customer.cards.retrieve(card.card_id)
    session[:item_id] = nil
  end
end
