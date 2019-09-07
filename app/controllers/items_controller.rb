class ItemsController < ApplicationController

  def index
  end

  def new
    @item=Item.new
  end

  def create
    @item=Item.new(item_params)
    @item.save
    binding.pry
    redirect_to controller: :items, action: :index
  end

  private
  def item_params
    params.require(:item).permit(:name,:detail,:price)
  end
end
