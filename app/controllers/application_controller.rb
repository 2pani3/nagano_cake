class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?


  def after_sign_in_path_for(resource)
    # flash[:notice] = "Welcome! You have signed up successfully."
    root_path
  end

  def after_sign_out_path_for(resource)
     root_path
  end



  protected

  def configure_permitted_parameters

    devise_parameter_sanitizer.permit(:sign_up, keys: [:name,:last_name,:first_name,:last_name_kana,:first_name_kana,:postcode,:address,:phone_number])
  end
end
