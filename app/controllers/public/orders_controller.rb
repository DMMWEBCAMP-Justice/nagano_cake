class Public::OrdersController < ApplicationController

  def new
    @order = Order.new
    @address = Address.new
    @end_user = current_end_user
  end

  def confirm
    @order = Order.new(order_params)
    @order.end_user_id = current_end_user.id
    @shipping_cost = 800
    if params[:order][:address_pass] == "0"
      @order.postcode = current_end_user.postcode
      @order.address = current_end_user.address
      @order.name = current_end_user.last_name + current_end_user.first_name

    elsif params[:order][:address_pass] == "1"
      @order.postcode = Address.find(params[:order][:address]).postcode
      @order.address = Address.find(params[:order][:address]).address
      @order.name = Address.find(params[:order][:address]).name
    else
    end
    @cart_items = CartItem.where(end_user_id: current_end_user.id)
    @total = @cart_items.inject(0) { |sum, item| sum + item.sum_of_price }
  end

  def create
    @order = Order.new(order_params)
    @order.end_user_id = current_end_user.id
    @order.save
    @cart_items = current_end_user.cart_items
      @cart_items.each do |cart_item|
        @order_details = @order.order_details.new
        @order_details.item_id = cart_item.item.id
        @order_details.price = cart_item.item.price
        @order_details.amount = cart_item.amount
        @order_details.save
      end
      current_end_user.cart_items.destroy_all
      redirect_to orders_complete_path
  end

  def index
    @orders = current_end_user.orders
  end

  def show
    @order = Order.find(params[:id])
    @order_details = @order.order_details
    @shipping_cost = 800
    @total = @order.total_payment
  end

  private

  def order_params
    params.require(:order).permit(:address, :postcode, :name, :payment_method, :shipping_cost, :total_payment)
  end

end
