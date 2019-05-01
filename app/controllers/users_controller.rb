class UsersController < ApplicationController
    before_action :set_user, only: [:show, :edit, :update]

    def index
        # @users = User.all
    end

    def show
    end

    def edit
        
    end

    def update
        @user.update(user_params)
        # redirect_to users_path
    end

    private
    # Use callbacks to share common setup
    def set_user
      @user = User.find(params[:id])
    end
 
    # only allow the white list through.
    def user_params
      params.require(:user).permit(:first_name, :surname, :gender, :date_of_birth, :university)
    end
end

