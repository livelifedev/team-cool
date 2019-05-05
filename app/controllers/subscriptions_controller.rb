class SubscriptionsController < ApplicationController
    before_action :authenticate_user!, except: [:new, :create]


    def new
      if user_signed_in? && current_user.subscribed?
        redirect_to root_path, notice: "You are already a subscriber"
      end
    end
  
    def create
      Stripe.api_key = Rails.application.credentials.stripe_api_key
  
      plan_id = params[:plan_id]
      plan = Stripe::Plan.retrieve(plan_id)
      token = params[:stripeToken]
  
      customer = if current_user.stripe_id?
                  Stripe::Customer.retrieve(current_user.stripe_id)
                 else
                  Stripe::Customer.create(email: current_user.email, source: token)
                end
  
      subscription = customer.subscriptions.create(plan: plan.id)
  
      options = {
        stripe_id: customer.id,
        stripe_subscription_id: subscription.id,
        subscribed: true
      }
  
      current_user.update(options)
  
      redirect_to root_path, notice: "Your subscription was setup successfully!"
    end
  
    def destroy
      customer = Stripe::Customer.retrieve(current_user.stripe_id)
      customer.subscriptions.retrieve(current_user.stripe_subscription_id).delete
      current_user.update(stripe_subscription_id: nil)
      current_user.subscribed = false
  
      redirect_to root_path, notice: "Your subscription has been cancelled."
    end
  end
