class Public::OrdersController < ApplicationController

  def new
    @order = Order.new
    @address = Address.new
    @end_user = current_end_user
  end

  def confirm
    @order = Order.new(order_params)
    @order.end_user_id = current_end_user.id
    if params[:order][:address_pass] == "0"
      @order.postcode = current_end_user.postcode
      @order.address = current_end_user.address
      @order.name = current_end_user.first_name + current_end_user.last_name

    elsif params[:order][:address_pass] == "1"
      @order.postcode = Address.find(params[:order][:address]).postcode
      @order.address = Address.find(params[:order][:address]).address
      @order.name = Address.find(params[:order][:address]).name
    else
    end

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
