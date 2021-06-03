class RoomsController < ApplicationController
    
    
    def index
        if user_signed_in?
        @shops = Shop.all
        rooms = current_user.rooms
        @shop_ids = []
        rooms.each do |r|
          @shop_ids << r.shop_id
        end
        
        elsif shop_signed_in?
          @users = User.all
          rooms = current_shop.rooms
          @user_ids = []
          rooms.each do |r|
            @user_ids << r.user_id
          end
        end
        
    end
    
    
    def show
    @room = Room.find(params[:id])
    @message = Message.new
    @messages = @room.messages
    if user_signed_in?
      if @room.user_id == current_user.id
        @shop = @room.shop
      else
        redirect_to "/"
      end
    elsif shop_signed_in?
      if @room.shop.id == current_shop.id
        @user = @room.user
      else
        redirect_to "/"
      end

    else
      redirect_to "/"
    end
    end

  def create
    if user_signed_in?
      @room = Room.new(room_shop_params)
      @room.user_id = current_user.id
    elsif shop_signed_in?
      @room = Room.new(room_user_params)
      @room.shop_id = current_shop.id
    else
      redirect_to "/"
    end

    if @room.save
      redirect_to :action => "show", :id => @room.id
    else
      redirect_to "/"
    end
  end

  private
  def room_shop_params
    params.require(:room).permit(:shop_id)
  end

  def room_user_params
    params.require(:room).permit(:user_id)
  end
end
