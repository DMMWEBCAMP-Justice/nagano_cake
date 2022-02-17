class Public::OrdersController < ApplicationController

  def index
    @orders = Order.all
  end

  def show
    @order = Oder.find(params[id])
  end

end
