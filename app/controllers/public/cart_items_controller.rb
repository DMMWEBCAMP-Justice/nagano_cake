class Public::CartItemsController < ApplicationController


   def index
     @cart_items = current_end_user.cart_items.all
     @total = @cart_items.inject(0) { |sum, item| sum + item.sum_of_price }
   end

   def create
     @cart_item= CartItem.new(cart_item_params)
     # @cart_items = current_end_user.cart_items
     if current_end_user.cart_items.find_by(item_id: params[:cart_item][:item_id]).present?
      #    1. 追加した商品がカート内に存在するかの判別
         @cart_item = current_end_user.cart_items.find_by(item_id: params[:cart_item][:item_id])
          #     存在した場合
         @cart_item.amount += params[:cart_item][:amount].to_i
        #cart_item.amountに今追加したparams[:cart_item][:amount]を加える
        #.to_iとして数字として扱う
         @cart_item.save
         redirect_to cart_items_path
     else
       @cart_item = current_end_user.cart_items.new(cart_item_params)
       @cart_item.save
       redirect_to cart_items_path
     end
   end

   def update
      @cart_items= CartItem.find(params[:id])
      @cart_items.update(cart_item_params)
       redirect_to cart_items_path
   end

   def destroy
     @cart_items = CartItem.find(params[:id])
     @cart_items.destroy
       redirect_to cart_items_path
   end

   def destroy_all
       @cart_items = current_end_user.cart_items.all
       @cart_items.destroy_all
        redirect_to cart_items_path
   end



    private

    def cart_item_params
        params.require(:cart_item).permit(:item_id, :amount, :end_user_id)
    end

end

