class PaymentsController < ApplicationController
  # skip_before_action :verify_authenticity_token

  def stripe
    payment_id = params[:data][:object][:payment_intent]
    client_id = params[:data][:object][:client_reference_id]
    user = User.find(client_id).update(stripe_transaction:payment_id)
    render json: ""
  end

  def success
    
  end

end