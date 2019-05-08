module UsersHelper
    
    def subscribed?
        stripe_subscription_id?
    end

end
