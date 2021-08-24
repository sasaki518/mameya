class Users::ItemsController < ApplicationController
    
    def  index
        @shop = Shop.find(params[:shop_id])
        @items = @shop.items
        p @items
        p @items.valid?
        p params
    end
    
    def show
        @item = Item.find(params[:id])
        @shop = Shop.find(params[:shop_id])
        p @items
        p @items.valid?
        p params
    end
end