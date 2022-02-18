class ApplicationController < ActionController::Base
 #before_action :authenticate_end_user!,except: [:top,:about,:index,:show]

 before_action :configure_permitted_parameters, if: :devise_controller?

  def after_sign_up_path_for(resource)
  end_users_mypage(resource)
  end


 protected

 def configure_permitted_parameters
  devise_parameter_sanitizer.permit(:sign_up,keys: [:last_name,:first_name,:last_name_kana,:first_name_kana,:postcode,:address,:phone_number])
 end

end
