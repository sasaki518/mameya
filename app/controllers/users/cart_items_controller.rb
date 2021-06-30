class Users::CartItemsController < UserController
    
    #cart_idをとってくる
    def create
        #ショップの詳細ページのidを持ってくる
        shop = Shop.take
        cart = Cart.find_or_create_by(user_id: current_user.id, shop_id: shop.id)
        cart_item = cart.cart_items.build(item_id: params[:item_id], count: params[:count])
        #cart_item.item.where(itemname: params[:itemname], gram: params[:gram], price: params[:price])
        cart_item.cart_id = cart.id
        if cart_item.save
            flash[:notice] = "カートに商品を追加しました。"
            #商品の詳細ページに飛ぶようにする
            redirect_to users_cart_path(:cart_id)
        else
            flash.now[:alert] = "商品の追加に失敗しました。"
            redirect_to items_path #item/showに変更する
        end
        
    end
    
    def edit
    end
    
    
    def destroy
        cart_items = Cart_items.find(cart_id: params[:cart_id])
        cart_item.destroy
        flash[:notice] = "カートから商品を削除しました"
        redirect_to users_cart_path(cart_id)
    end
end