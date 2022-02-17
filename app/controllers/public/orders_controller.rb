class Public::OrdersController < ApplicationController

 def new
   @order = Order.new
   @end_user = current_end_user
   @address = Address.new
 end

 def create
  @order = Order.new(order_params)
  @order.end_user_id = current_end_user.id
  if @order.save
   redirect_to orders_confirm_path
  else
   render:new
  end
 end
 
 def confirm
 end
 

 private

 def order_params
   params.require(:order).permit(:postcode, :address, :name, :shipping_cost, :total_payment, :payment_method, :order_status)
 end
end
