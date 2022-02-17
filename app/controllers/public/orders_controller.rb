class Public::OrdersController < ApplicationController

 def new
   @order = Order.new
   @end_user = current_end_user
   @address = Address.new
 end
 
 def confirm
  @order = Order.new(order_params)
  @address = Address.find(params[:order][:address_id])
  @order.postcode = current_end_user.postcode
  @order.address = current_end_user.address
  @order.name = current_end_user.first_name + current_end_user.last_name
 end

 private

 def order_params
   params.require(:order).permit(:postcode, :address, :name, :shipping_cost, :total_payment, :payment_method, :order_status)
 end
end
