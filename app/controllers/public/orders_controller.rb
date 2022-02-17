class Public::OrdersController < ApplicationController

 def new
   @order = Order.new
   @end_user = current_end_user
   @address = Address.new
 end

 private

 def order_params
   params.require(:order).permit(:postcode, :address, :name, :shipping_cost, :total_payment, :payment_method, :order_status)
 end
end
