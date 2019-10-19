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
    @items = Item.find(params[:item_id])
  end

  def pay
    card = Card.where(user_id: current_user.id).first
    @items=Item.find(1)
    Payjp.api_key = ENV['PAYJP_PRIVATE_KEY']
    Payjp::Charge.create(
      amount: @items.price,
      customer: card.customer_id,
      currency: 'jpy',
    )
    redirect_to action: "done"
  end

  def done
    @items=Item.(1)
    card = Card.where(user_id: current_user.id).last
    customer = Payjp::Customer.retrieve(card.customer_id)
    @default_card_information = customer.cards.retrieve(card.card_id)
  end

  private 
  def item_id
    params.require().permit(:id)
  end

end
