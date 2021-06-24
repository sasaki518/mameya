class ShopController < ApplicationController
    before_action :authenticate_shop!
    render :layout => "shops/bar"
end