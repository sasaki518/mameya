class Users::CartsController < UserController
  
  
  def index
    @user = current_user.id
    @carts = current_user.carts
    p @carts.class
    @room = Room.find_or_create_by(shop_id: params[:shop_id], user_id: current_user.id)
    @message = Message.new(message_params)
  end


   private
    
    def message_params
        params.permit(:text)
    end
end