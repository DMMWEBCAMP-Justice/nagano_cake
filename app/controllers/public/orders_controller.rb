class Public::OrdersController < ApplicationController

  def index
    @orders = current_end_user.orders
  end

  def show
    @order = Order.find(params[id])
    @order_details = current_end_user.order_details
  end

end
