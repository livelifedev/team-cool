class AccountsController < ApplicationController
  

  def index
    @stripe_session = Stripe::Checkout::Session.create(
        payment_method_types: ['card'],
        line_items: [{
        name: 'Lib U Account',
        description: 'A one-time payment to join Lib U',
        amount: 5000,
        currency: 'aud',
        quantity: 1,
        }],
        #change this to dynamic using env variable
        success_url: 'http://localhost:3000/payments/success', 
        cancel_url: 'http://localhost:3000/cancel',
    )
  end

  def profile
    @documents = Document.where(user_id: current_user.id)
  end

end