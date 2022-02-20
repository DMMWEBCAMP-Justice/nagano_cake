class ApplicationController < ActionController::Base
 # before_action :authenticate_end_user!, except: [:top,:about,:index,:show]
 #before_action :authenticate_end_user!,except: [:top,:about,:index,:show]
 before_action :configure_permitted_parameters, if: :devise_controller?


  def after_sign_up_path_for(resource)
    end_users_my_page_path(resource)
  end
  #サインイン後にマイページに遷移してない。。。

  def after_sign_out_path_for(resource_or_scope)
    if resource_or_scope == :end_user
        root_path
    elsif resource_or_scope == :admin
        new_admin_session_path
    else
        root_path
    end
  end




 protected

 def configure_permitted_parameters
  devise_parameter_sanitizer.permit(:sign_up,keys: [:last_name,:first_name,:last_name_kana,:first_name_kana,:postcode,:address,:phone_number])
  devise_parameter_sanitizer.permit(:account_update,keys: [:last_name,:first_name,:last_name_kana,:first_name_kana,:postcode,:address,:phone_number])
 end

end
