class Public::ItemsController < ApplicationController
  def index
    @items = Item.page(params[:page]).per(8)#1ページに8個表示する
    @genres = Genre.all
  end

  def show

  end

  private

  def item_params
    params.require(:item).permit(:item_name, :price, :introduction, :item_status, :image_id)
  end
end
