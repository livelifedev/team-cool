class UsersController < ApplicationController
    before_action :set_user, only: [:show, :edit, :update]
#     before_action :set_gender, only: [:edit, :update]

    def index
        @users = User.all
    end

#     def show
#         stripe_session = Stripe::Checkout::Session.create(
#             client_reference_id: current_user.id,
#             payment_method_types: ['card'],
#             line_items: [{
#                 name: @document.title,
#                 description: @document.description,
#                 amount: @document.deposit,
#                 currency: 'aud',
#                 quantity: 100,
#             }],

#             payment_intent_data: {
#                 metadata: {
#                     listing_id: @document.id
#                 }
#             },

#             success_url: 'http://localhost:3000/payments/success',
#             cancel_url: 'http://localhost:3000/cancel',
# )
#        @stripe_session_id = stripe_session.id
#     end

#     def edit
        
#     end

    def update
        @user.update(user_params)
        redirect_to users_path
    end

    private
    
#     def set_gender
#       @gender = User.genders.keys
#     end

    def set_user
      @user = User.find(params[:id])
    end


 
    # only allow the white list through.
    def user_params
      params.require(:user).permit(:first_name, :surname, :username, :gender, :birthday, :school)
    end
end

