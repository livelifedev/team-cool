class AccountsController < ApplicationController
  
  def index
    user_id = current_user.id.to_s
    @stripe_session = Stripe::Checkout::Session.create({
        payment_method_types: ['card'],
        client_reference_id: user_id,
        line_items: [{
        name: 'Lib U Account',
        description: 'A one-time payment to join Lib U',
        amount: 5000,
        currency: 'aud',
        quantity: 1,
        }],
        #make this dynamic using env variable
        success_url: 'http://localhost:3000/payments/success', 
        cancel_url: 'http://localhost:3000/cancel',
    })
  end

  def profile
    @documents = Document.all
    @user_documents = Document.where(user_id: current_user.id)
  end

  def admin
    @users = User.all
    @documents = Document.all
  end



end