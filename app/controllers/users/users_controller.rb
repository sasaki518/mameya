class UsersController < ApplicationController
    
    
    def create
        if @user.save
            UserMailer.send_confirm_to_user(@user).deliver
            redirect_to users_path
        else
            render :new
        end
    end
end
