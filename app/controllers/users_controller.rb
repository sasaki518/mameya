class UsersController < ApplicationController
    
    
    
    def index
        @shop = Shop.all
        @user = User.all
    end
    
    def show
        @item = Item.find_by(params[:id])
        @shop = Shop.find_by(id: @item.shop_id)
        @user = User.find(params[:id])
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
