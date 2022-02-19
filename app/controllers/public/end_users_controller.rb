class Public::EndUsersController < ApplicationController

  def show
    @end_user = current_end_user
  end

  def finished
    @end_user = current_end_user
  end

  def withdraw
    @end_user = current_end_user
    @end_user.update(finished: true)
    reset_session
    redirect_to root_path
  end

  def finished
    @user = current_end_user
  end

end
