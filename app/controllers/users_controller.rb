class UsersController < ApplicationController
    
    
    
    
    def index
        @shop = Shop.all
        @user = User.all
    end
    
    def show
    end
    
    def create
        if @user.save
            UserMailer.send_confirm_to_user(@user).deliver
            redirect_to users_path
        else
            render :new
        end
    end
    
    
end
