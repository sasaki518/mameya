class Users::ShopsController < ApplicationController
    
    def index
        @shops = Shop.all
        render :layout => "user"
    end
    
    def show
        @shop = Shop.find(params[:id])
    end
end
