require 'rails_helper'

RSpec.describe Shops::MessagesController, type: :request do
    let(:shop) {create(:shop)}
      let!(:user){create(:user)}
    
   
       
       describe "#create" do
        context "バリデーションエラー" do
            let!(:room){create(:room, shop_id: shop.id, user_id: user.id)}
            let!(:messgae){create(:message, room_id: room.id)}
            let(:params){ {message: {text: ""}}}
            it "response success" do
                post "/shops/rooms/#{room.id}/messages", params: params
                expect(response.status).to eq(200)
            end
            
            it "render new" do
                post "/shops/rooms/#{room.id}/messages", params: params
                expect(response.body).to include "メッセージ送信に成功しました"
            end
            
            it "render error" do
                post "/shops/rooms/#{room.id}/messages", params: params
                expect(response.body). to include "送信に失敗しました"
            end
        end
        
        context "送信成功" do
            let(:room){create(:room, shop_id: shop.id, user_id: user.id)}
            let(:message){build(:message)}
            let(:params) { {message: {text: message.text}} }
            let(:created_message) { Message.last }
            
            it "response redirect" do
                post "/shops/rooms/#{room.id}/messages", params: params
                expect(response.status). to redirect_to shops_room_path(room)
            end
            
            it "response redirect" do
                expect{
                    post "/shops/rooms/#{room.id}/messages", params: params
                }.to change{ Message.count }.by(1)
            end
        end
    end
   #end
end