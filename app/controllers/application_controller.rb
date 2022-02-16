class ApplicationController < ActionController::Base

  def after_sign_up_path_for(resource)
  end_user_mypage(resource)
  end

end
