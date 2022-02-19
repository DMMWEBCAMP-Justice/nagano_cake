class Public::CartItemsController < ApplicationController

 def index
   @cart_items = CartItem.all
   @caret_item = CartItem.find(params[:id])
 end
 
 # def create
 #    @cart_item =CartItem.find_by(id: @item.cart_item_id)
 #     if @cart_item.save
 #  1. 追加した商品がカート内に存在するかの判別
 #    存在した場合
 #      2. カート内の個数をフォームから送られた個数分追加する
    
      
 #    else
 #      @cart_item = CartItem.new
 # end
 
 def update
 end
 
 def destroy
  @cart_item = Cart_item.find(params[:id])
  if @cart_item.end_user_id == current_user.id
     @cart_item.destroy
     redirect_to cart_items_path
  end
 end
 
 def destroy_all
    @cart_item = CartItem.find(params[:id])
    if @cart_item.end_user_id == current_user.id
      @cart_item.destroy_all
      redirect_to cart_items_path
    end
 end
 
  

 
 
   private
  def cart_item_params
      params.require(:cart_item).permit(:item_id, :amount)
  end
  
>>>>>>> c645149c1dd0698a439718185a7a1081b3b34c21
end
