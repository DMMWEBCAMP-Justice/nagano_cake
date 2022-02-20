class Public::OrdersController < ApplicationController

  def new
    @order = Order.new
    @address = Address.new
  end

  def confirm
    @order = Order.new(order_params)
    @address = Address.find(params[:order][:address_id])
    @order.postcode = @address.postcode
    @order.address = @address.address
    @order.name = @address.name
  end

  def index
    @orders = current_end_user.orders
  end

  def show
    @order = Order.find(params[id])
    @order_details = current_end_user.order_details
  end

  private

  def order_params
    params.require(:order).permit(:address, :postcode, :name, :payment_method)
  end

end
