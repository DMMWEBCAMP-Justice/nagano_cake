class Admin::ItemsController < ApplicationController

  def new
    @item = Item.new
  end

  def create
     @item = Item.new(item_params)
     if @item.save
      redirect_to admin_item_path(@item.id)
     else
      render :new
     end
  end

  def index
     @items=Item.page(params[:page])
     
  end
  
  def show
     @item = Item.find(params[:id])
     @order_details = @item.order_details
  end
  
  def edit
    @item=Item.find(params[:id])
      redirect_to "edit"
  end
  
  def update
    @item = Item.find(params[:id])
    if @item.update(item_params)
      flash[:notice] = "You have updated user successfully."
      redirect_to admin_item_path(@item.id)
    else
      render :edit
    end
  end



  private

  def item_params
    params.require(:item).permit(:item_name, :price, :genre_id, :item_status, :image_id, :introduction) 
  end

end