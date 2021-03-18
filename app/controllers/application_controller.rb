class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :user_deletable?, only: %i[ destroy ], if: -> { controller_name == "registrations" }
  
  def after_sign_in_path_for(resource)
      top_pages_home_path
  end
  
  def after_sign_up_path_for(resource)
      top_pages_home_path
  end
  
  def configure_permitted_parameters
    added_attrs = [ :email, :name, :password, :password_confirmation ]
    devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
    devise_parameter_sanitizer.permit :account_update, keys: added_attrs
    devise_parameter_sanitizer.permit :sign_in, keys: added_attrs
  end
  
  def user_deletable?
    unless current_user.sales == 0 && current_user.lessons.blank?
      redirect_to root_path, flash: {danger: '売上が残っているか、関係するレッスンが残っているため、アカウント削除できません。'}
    end
  end
  
end
