class Public::EndUsersController < ApplicationController

  def show
<<<<<<< HEAD
    @end_user = current_end_user
  end

  def update
   end_user = current_end_user
   end_user.update(end_user_params)
   redirect_to end_users_my_page_path
  end

  def finished
    @end_user = current_end_user
  end

  def withdraw
    @end_user = current_end_user
    @end_user.update(finished: true)
    reset_session
    redirect_to root_path
=======
    @user = current_end_user
  end

  def finished
    @user = current_end_user
>>>>>>> 31a7c7d378ec8b93b7c84697b9dcdd883c661946
  end


 private
  def end_user_params
    params.require(:end_user).permit(:last_name,:first_name,:last_name_kana,:first_name_kana,:postcode,:address,:phone_number)
  end
end
