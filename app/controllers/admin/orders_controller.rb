class Admin::OrdersController < ApplicationController

  def index
    @orders = Order.all
  end

  def show
    @order = Order.find(params[:id])
    @total_price = Order.total_payment
  end

  private

  def order_params
    params.require(:order).permit(:order_status)
  end
end