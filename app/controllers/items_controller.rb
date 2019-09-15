class ItemsController < ApplicationController

  def index
  end

  def new
    @parents=Category.all.order("id ASC").limit(13)
    respond_to do |format|
      format.html
      format.json do
        if params[:parent_id] != nil
          @children=Category.find(params[:parent_id]).children
        else params[:parent_id_two] != nil
          @children=Category.find(params[:parent_id_two]).children
        end
      end
    end
    @item=Item.new
  end

  def create
    @item=Item.create(item_params)
    redirect_to controller: :items, action: :index
  end

  private
  def item_params
    params.require(:item).permit(:name,:detail,:price,:size,:brand,:condition,:shipping_fee,:shipping_method,:ship_out_area,:ship_out_date,:category_id,:category_ancestry).merge(user_id: current_user.id)
  end
end
