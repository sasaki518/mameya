class Users::CartItemsController < UserController
    
       def create
       shop = Shop.find(params[:shop_id])
       cart = Cart.find_or_create_by(user_id: current_user.id, shop_id: shop.id)
       cart_item = cart.cart_items.build(item_id: params[:item_id], count: params[:count])
       cart_item.cart_id = cart.id
       p cart_item
       p cart_item.valid?
       p params
       if cart_item.save
           flash[:notice] = "カートに商品を追加しました。"
           redirect_to users_carts_path
       else
           flash.now[:alert] = "商品の追加に失敗しました。"
           render "users/carts/index"
         
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