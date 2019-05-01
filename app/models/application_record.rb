class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true
  # before_filter :configure_permitted_parameters, if: :devise_controller?

  # def configure_permitted_parameters
  #  devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:firstname, :lastname, :email, :password, :password_confirmation, :date_of_birthm :gender, :university) } 
  # end

  # protect_from_forgery with: :exception
end
