class ApplicationController < ActionController::Base
       protect_from_forgery with: :exception
       before_action :configure_permitted_parameters, if: :devise_controller?
       rescue_from CanCan::AccessDenied do |exception|
              redirect_to questions_path, :alert => exception.message
       end  
       
     
       protected

       def configure_permitted_parameters
               devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:email, :password, :first_name, :surname, :username, :gender, :birthday, :school)}
               devise_parameter_sanitizer.permit(:sign_in) { |u| u.permit(:email, :password)}
               devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:first_name, :surname, :username, :birthday, :gender, :email, :password, :current_password)}
       end

       def access
              if current_user.stripe_transaction == "unpaid" || current_user.stripe_transaction.nil?
                     redirect_to accounts_path
              end
       end
       
end
