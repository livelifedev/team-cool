class RegistrationsController < Devise::RegistrationsController
    before_action :authenticate_user!
  
    protected
      def after_sign_up_path_for(user)
        "/accounts"
      end
  
      def after_inactive_sign_up_path_for(user)
        '/accounts'
      end

      
end
  