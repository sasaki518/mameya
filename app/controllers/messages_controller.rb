class MessagesController < ApplicationController
    
    
    
    def create
        @room = Room.find(params[:room_id])
        @message = Message.new(message_params)
        if user_signed_in?
            @message.is_user = true
        elsif shop_signed_in?
            @message.is_user = false
        end
        @message.room_id = @room.id
        if @message.save!
            flash[:notice] = "メッセージ送信に成功しました"
            redirect_to room_url(@room)
        else
            flash.now[:alert] = "送信に失敗しました"
            redirect_to room_url(@room)
        end
    end
    
    private
    
    def message_params
        params.require(:message).permit(:text)
    end
    
end
