class ItemsController < ApplicationController
  before_action :set_item, only: [:show, :destroy]

  def index
    @items = Item.order('id DESC').limit(4)
  end

  def new
    @parents = Category.all.order("id ASC").limit(13)
    respond_to do |format|
      format.html
      format.json do
        if params[:parent_id] != nil
          @children = Category.find(params[:parent_id]).children
        elsif params[:parent_id] == nil && params[:parent_id_two] != nil
          @children_two = Category.find(params[:parent_id_two]).children
        elsif params[:size] != nil
          @size = params[:size]
          @size_two = params[:size_two]
          @size_three = params[:size_three]
        elsif params[:delivery] != nil
          @delivery = params[:delivery]
        end
      end
    end
    @item = Item.new
    @item.images.build
  end

  def create
    @parents = Category.all.order("id ASC").limit(13)
    @item = Item.new(item_params)
    if @item.save
      redirect_to controller: :items, action: :index
    elsif params[:item][:images_attributes] != nil
      render :new
    else
      @item.images.build
      render :new
    end
  end

  def show
  end

  def destroy
    if @item.destroy
      redirect_to root_path, notice: "商品が削除されました"
    else
       redirect_to item_path(@item), alert: "削除に失敗しました"
    end
  end

  def edit
    @item = Item.includes(:images).find(params[:id])
    # @item.image.cache! unless @item.image.blank?
  end

  def update
    @item = Item.includes(:images).find(params[:id])
    @item.update(update_item_params)
    redirect_to root_path
  end

  private
  def item_params
    params.require(:item).permit(:name,:detail,:price,:size,:brand,:condition,:shipping_fee,:shipping_method,:ship_out_area,:ship_out_date,:category_id,images_attributes:[:image]).merge(user_id: current_user.id)
  end

  def update_item_params
    params.require(:item).permit(:name,:detail,:price,:size,:brand,:condition,:shipping_fee,:shipping_method,:ship_out_area,:ship_out_date,:category_id,images_attributes:[:image, :id]).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end
end
