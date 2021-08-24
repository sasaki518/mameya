class Users::MessagesController < UserController
    
    
    
    def create
        @room = Room.find(params[:room_id])
        @message = Message.new(message_params)
        @message.room_id = @room.id
        @user = @room.user_id
        @shop = @room.shop_id
        if @message.save
            flash[:notice] = "メッセージ送信に成功しました"
            redirect_to users_room_path(@room)
            ShopMailer.send_message_to_shop(@shop).deliver
        else
            flash.now[:alert] = "送信に失敗しました"
            render "users/rooms/show"
        end
    end
    
    private
    
    def message_params
        params.require(:message).permit(:text)
    end
    
end
