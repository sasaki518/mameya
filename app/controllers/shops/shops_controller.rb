class ShopsController < ApplicationController
    
    
    def index
        @shops = Shop.all
    end
    
    def show
        @shop = Shop.find(params[:id])
        @items = @shop.items
    end
end
