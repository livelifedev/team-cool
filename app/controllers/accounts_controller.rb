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
        #change this to dynamic using env variable
        success_url: 'http://localhost:3000/payments/success', 
        cancel_url: 'http://localhost:3000/cancel',
    })
  end

  def profile
    @documents = Document.where(user_id: current_user.id)
  end

  def admin
    @users = User.all
    @documents = Document.all
  end

  # def destroy
  #   @user = User.find(params[:id])
  #   @user.destroy
  #   redirect_to admin_path, notice: 'User deleted.'
  # end

end