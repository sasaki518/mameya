class ShopsController < ApplicationController
    
    def index
        @shops = Shop.all
        @items = Item.all
    end
    
    def show
        @shop = Shop.find(1)
        
        @items = Item.find(1)

    end
end
