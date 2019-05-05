module ApplicationHelper

    def current_user_subscribed?
        user_signed_in? && current_user.subscribed?
    end

    def admin?
        user_signed_in? && current_user.admin?
    end

    def subscribed?
        user_signed_in? && current_user.subscribed?        
    end

    def user_add_to_library? user, document
        user.libraries.where(user: user, document: document).any?
    end


end
