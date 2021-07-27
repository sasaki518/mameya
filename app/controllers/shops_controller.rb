class ShopsController < ApplicationController
    
    
    def show
        @shop = current_shop
        @items = current_shop.items
    end
end