class ItemsController < ApplicationController

  def index
  end

  def new
    @item=Item.new
  end

  def create
    Item.create(item_params)
    redirect_to controller: :items, action: :index
  end

  private
  def item_params
    params.require(:item).permit(:name,:detail,:price)
  end
end
