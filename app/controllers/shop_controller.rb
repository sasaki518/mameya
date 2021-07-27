class ShopController < ApplicationController
    
    before_action :authenticate_shop!
    layout "shop"
    
end