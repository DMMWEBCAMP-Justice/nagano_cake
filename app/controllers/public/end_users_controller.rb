class Public::EndUsersController < ApplicationController

  def show
    @user = current_end_user
  end

  def finished
    @user = current_end_user
  end

end
