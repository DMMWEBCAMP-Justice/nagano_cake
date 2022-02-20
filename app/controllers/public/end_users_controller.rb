class Public::EndUsersController < ApplicationController

  def show
    @user = current_end_user
  end
# 管理者側で編集機能を追加する際に必要な記述です。これ書いたら正常に動作しました。
  def update
    @end_user = EndUser.find(params[:id])
    @end_user.update(end_user_params)
    redirect_to admin_end_user_path(@end_user)
  end

  private

  def end_user_params
    params.require(:end_user).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :postcode, :phone_number, :email)
  end

  def finished
    @user = current_end_user
  end

  def finished
    @user = current_end_user
  end

end
