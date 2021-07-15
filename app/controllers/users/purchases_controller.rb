class Users::PurchasesController < ApplicationController

    def create
        @cart = Cart.find(params[:cart_id])
        @shop = Shop.find(@cart.shop_id)
        @room = Room.find_or_create_by(shop_id: @shop.id, user_id: current_user.id)
        Message.create(text: @cart.purchase_message, room_id: @room.id, is_user: true)
        @cart.cart_items.destroy_all
    end
end