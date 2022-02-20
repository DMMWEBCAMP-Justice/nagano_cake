class Public::ItemsController < ApplicationController
  def index
    @items = Item.page(params[:page]).per(8)#1ページに8個表示する
    @genres = Genre.all
  end

  def show

   @item = Item.find(params[:id])
   @genres = Genre.all
   @cart_item = CartItem.new
  
  # @cart_items = current_end_user.cart_items.all

  end

 

  
  
end
