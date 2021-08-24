class UsersController < ApplicationController
  
    def create
        user_params = params.require(:user).permit(:name, :email, :password, :password_confirmation)
        @user = User.new(user_params)
        if @user.save
            UserMailer.send_confirm_to_user(@user).deliver
            flash[:notice] = "サインアップが完了しました"
            redirect_to homes_users_path
        else
            flash.now[:alert] = "サインアップに失敗しました。"
            render  "users/registrations/new"
        end
    end
end
