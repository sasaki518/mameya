class ShopsController < ApplicationController
    
    
    def index
        @shop = Shop.find(shop_id: params[:shop_id])
    end
end