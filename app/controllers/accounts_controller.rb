class AccountsController < ApplicationController
  
  def index
    user_id = current_user.id.to_s
    domain = request.base_url
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
        success_url: "#{domain}/payments/success", 
        cancel_url: "#{domain}/cancel",
    })
  end

  def profile
    @documents = Document.all
    @user_documents = Document.where(user_id: current_user.id)
  end

  def admin
    @users = User.all
    @documents = Document.all
    @subjects = Subject.all
  end



end