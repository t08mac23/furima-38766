class OrdersController < ApplicationController
  before_action :authenticate_user!

  def index
    @item = Item.find(params[:item_id])
    @order_delivery = OrderDelivery.new
  end

  def create
    @item = Item.find(params[:item_id])
    @order_delivery = OrderDelivery.new(order_params)
    # binding.pry
    if @order_delivery.valid?
      @order_delivery.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def order_params
    params.require(:order_delivery).permit(:postal_code, :prefecture_id, :address1, :address2, :building, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id])
  end

end
