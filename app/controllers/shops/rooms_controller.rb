class Shops::RoomsController < ShopController
    
    
    def index
      @rooms = current_shop.rooms
    end
    
    
    def show
      @room = current_shop.rooms.find(params[:id])
      @user = @room.user
      @message = Message.new
      @messages = @room.messages
      
    end

  private
  def room_shop_params
    params.require(:room).permit(:shop_id)
  end

  def room_user_params
    params.require(:room).permit(:user_id)
  end
end
