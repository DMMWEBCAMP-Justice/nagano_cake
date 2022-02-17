class Admin::ItemsController < ApplicationController

  def new
    @item = Item.new
    @item.genre_id =Genre.all
  end

  def create
     @item = Item.new(item_params)
    　@item.genre_id =Genre.all
     if @item.save
      redirect_to admin_item_path(@item.id)
     else
      render :new
     end
  end





  private

  def item_params
    params.require(:item).permit(:item_name, :price, :genre_id, :item_status, :image_id, :introduction) 
  end

end
