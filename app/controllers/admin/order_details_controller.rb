class Admin::OrderDetailsController < ApplicationController

  def update
    @order_detail = OrderDetail.find(params[:id])
    @order = @order_detail.order
    @order_detail.update(order_detail_params)
    @order.update(order_status: "making") if @order.order_details.where(making_status: "making").count == @order.order_details.count
    @order.update(order_status: "prepare") if @order.order_details.where(making_status: "finished").count == @order.order_details.count
    redirect_to request.referer
  end



  private

  def order_detail_params
    params.require(:order_detail).permit(:making_status)
  end



end
