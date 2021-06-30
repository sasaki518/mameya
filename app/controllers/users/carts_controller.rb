class Users::CartsController < UserController
  
  
  def show
    @shops = Shop.take #ショップ詳細のidをとってくる
    @carts = Cart.find_or_create_by(user_id: current_user.id, shop_id: @shops.id)
    @cart_items = @carts.cart_items
  end
  
end