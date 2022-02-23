class Admin::OrdersController < ApplicationController

  def index
    @orders = Order.page(params[:page])
  end

  def show
    @order = Order.find(params[:id])
    @order_details = @order.order_details
  end

  def update
    @order = Order.find(params[:id])
    @order_details = @order.order_details
    @order.update(order_params)
    @order_details.update_all(making_status: "waiting") if @order.order_status == "paid"
    redirect_to request.referer
  end

  private

  def order_params
    params.require(:order).permit(:order_status)
  end
end