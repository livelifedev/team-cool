class PaymentsController < ApplicationController
  skip_before_action :verify_authenticity_token

  def stripe
    # byebug
    payment_id = params[:id]
  end

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
        success_url: 'http://localhost:3000/payment/success', 
        cancel_url: 'http://localhost:3000/cancel',
    )
  end

  def success
    render plain: "success"
  end

end