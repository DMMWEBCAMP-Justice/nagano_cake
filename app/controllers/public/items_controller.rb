class Public::ItemsController < ApplicationController
  before_action :redirect_root, except: :index
  
  def index
    @items = Item.page(params[:page]).per(8)#1ページに8個表示する
    @genres = Genre.all
  end

  def show

   @item = Item.find(params[:id])
   @genres = Genre.all
   @cart_item = CartItem.new
  end

 private

 def redirect_root
  redirect_to root_path unless end_user_signed_in?
 end
  
  
end
