class ItemsController < ApplicationController
    
    def index
        #@item = Item.find_by(params[:id])
        #@shop = Shop.find_by(id: @item.shop_id)
        
        
        @shop = Shop.find(1)
        @item = Item.find(1)
    end
    
    def show
        @shop = Shop.find(params[:id])
        @item = Item.find(params[:id])
    end
end