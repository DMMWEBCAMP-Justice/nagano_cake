class Admin::EndUsersController < ApplicationController

  def index
    @end_users = EndUser.page(params[:page])
  end

  def edit
    @end_user = EndUser.find(params[:id])
  end

  def update
    @end_user = EndUser.find(params[:id])
    @end_user.update(end_user_params)
    redirect_to admin_end_user_path(@end_user)
  end

  def show
    @end_user = EndUser.find(params[:id])
  end

  private

  def end_user_params
    params.require(:end_user).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :postcode, :phone_number, :email, :address, :finished)
  end
end
