class Public::CartItemsController < ApplicationController

 def index
   @cart_items = CartItem.all
   # @cart_items = current_end_user.cart_items
 end

 def create
   @cart_item = current_end_user.cart_items.build(cart_item_params)
   @cart_items = current_end_user.cart_items.all
   @cart_items.each do |cart_item|
    if cart_item.item_id == @cart_item.item_id
      new_quantity = cart_item.quantity + @cart_item.quantity
      cart_item.update(:amount, new_quantity)
      @cart_item.delete
    end
  end
  @cart_item.save
  redirect_to :cart_items

 #    @cart_item =CartItem.find_by(id: @item.cart_item_id)
 #     if @cart_item.save
 #  1. 追加した商品がカート内に存在するかの判別
 #    存在した場合
 #      2. カート内の個数をフォームから送られた個数分追加する
 #    else
 #      @cart_item = CartItem.new
 end

 def update
   @cart_item = Cartitem.find(params[:id])
    if @cart_item.update(cart_item_params)
      redirect_to cart_item_path(@cart_item.id)

    end
 end

 def destroy
  @cart_item = Cartitem.find(params[:id])
  if @end_user == current_user.id
     @cart_item.destroy
     redirect_to cart_items_path
  end
 end

 def destroy_all
      @cart_item = CartItem.all
      if @end_user == current_user.id
      @cart_item.destroy_all
      redirect_to cart_items_path
      end
 end





   private
  def cart_item_params
      params.require(:cart_item).permit(:item_id, :amount)
  end

end
