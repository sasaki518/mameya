class Users::PurchasesController < ApplicationController

    def create
        @cart = Cart.find(params[:cart_id])
        @shop = Shop.find(@cart.shop_id)
        @user = current_user
        @room = Room.find_or_create_by(shop_id: @shop.id, user_id: current_user.id)
        ActiveRecord::Base.transaction do
            Message.create!(text: @cart.purchase_message, room_id: @room.id, is_user: true)
            @cart.cart_items.each do |ci|
                ci.destroy!
            end
            @cart.destroy!
        end
        flash[:notice] = "商品を購入しました。"
        redirect_to users_carts_path #成功
        UserMailer.send_purchase_confirmation_to_user(@user, @shop).deliver
    rescue => e
                p e
                flash.now[:alert] = "購入に失敗しました。"
                 render "carts/index" #失敗
                 return
    end
    
end