class Public::OrdersController < ApplicationController

  def index
    @orders = current_end_user.orders
  end

  def show
    @order = Order.find(params[:id])
    @order_details = @order.order_details
  end

end
