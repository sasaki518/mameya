class Users::RoomsController < UserController
    
    
    def index
      @shops = Shop.all
      @rooms =  current_user.rooms
    end
    
    
    def show
      @shop = Shop.find(params[:id])
      @room = current_user.rooms.find(params[:id])
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
