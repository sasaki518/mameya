class UsersController < ApplicationController
    
    
    
    def index
        @shop = Shop.all
    end
    
    def show
        @item = Item.find_by(params[:id])
        @shop = Shop.find_by(id: @item.shop_id)
    end
end
