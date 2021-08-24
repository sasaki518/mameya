require 'rails_helper'

RSpec.describe Users::MessagesController, type: :request do
    let(:user) {create(:user)}
     let!(:shop){create(:shop)}
    
   
       
       describe "#create" do
        context "バリデーションエラー" do
            let!(:room){create(:room, user_id: user.id, shop_id: shop.id)}
            let!(:messgae){create(:message, room_id: room.id)}
            let(:params){ {message: {text: ""}}}
            it "response success" do
                post "/users/rooms/:room_id/messages", params: params
                expect(response.status).to eq(200)
            end
            
            it "render new" do
                post "/users/rooms/#{room.id}/messages", params: params
                expect(response.body).to include "メッセージを送る"
            end
            
            it "render error" do
                post "/users/rooms/#{room.id}/messages", params: params
                expect(response.body). to include "送信に失敗しました"
            end
        end
        
        context "送信成功" do
            let(:room){create(:room, user_id: user.id, shop_id: shop.id)}
            let(:message){build(:message, room_id: room.id)}
            let(:params) { {message: {text: message.text}} }
            
            it "response redirect" do
                post "/users/rooms/#{room.id}/messages", params: params
                expect(response.status). to redirect_to users_room_path(room)
            end
            
            it "response redirect" do
                expect{
                    post "/users/rooms/#{room.id}/messages", params: params
                }.to change{ Message.count }.by(1)
            end
        end
    end
   #end
end