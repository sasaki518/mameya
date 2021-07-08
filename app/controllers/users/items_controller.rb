class Users::ItemsController < ApplicationController
    
    def  index
        @shop = Shop.find(params[:shop_id])
        @items = @shop.items
          render :layout => "user"
    end
    
    def show
        @item = Item.find(params[:id])
        @shop = Shop.find(params[:shop_id])
    end
end