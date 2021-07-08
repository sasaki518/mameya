class Users::CartItemsController < UserController
    
    #cart_idをとってくる
    def create
        shop = Shop.find(params[:shop_id])
        cart = Cart.find_or_create_by(user_id: current_user.id, shop_id: shop.id)
        cart_item = cart.cart_items.build(item_id: params[:item_id], count: params[:count])
        cart_item.cart_id = cart.id
        #cart_item.item.where(itemname: params[:itemname], gram: params[:gram], price: params[:price])
        if cart_item.save!
            flash[:notice] = "カートに商品を追加しました。"
            redirect_to users_carts_path
        else
            flash.now[:alert] = "商品の追加に失敗しました。"
            redirect_to users_shop_items_path(shop)
        end
        
    end
    
    def edit
    end
    
    
    def destroy
        cart_item = CartItem.find(params[:item_id]) #cart_idを取り出す
        cart_item.destroy
        flash[:notice] = "カートから商品を削除しました"
        redirect_to users_carts_path
    end
    
end