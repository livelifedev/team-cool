class UsersController < ApplicationController
    before_action :set_user, only: [:show, :edit, :update]
#     before_action :set_gender, only: [:edit, :update]

    def index
        @users = User.all
    end

#     def show
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

