class Shops::MessagesController < ApplicationController
    
    
    
    def create
        @room = Room.find(params[:room_id])
        @user = @room.user
        @shop = @room.shop
        @message = Message.new(message_params)
        @message.room_id = @room.id
        if @message.save!
            flash[:notice] = "メッセージ送信に成功しました"
            redirect_to shops_room_path(@room)
            UserMailer.send_message_to_user(@user, @shop).deliver
        else
            flash.now[:alert] = "送信に失敗しました"
            redirect_to shops_room_path(@room)
        end
    end
    
    private
    
    def message_params
        params.require(:message).permit(:text)
    end
    
end
