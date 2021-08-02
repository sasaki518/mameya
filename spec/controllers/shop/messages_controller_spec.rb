require 'rails_helper'

RSpec.describe Shops::MessagesController, type: :request do
    let(:shop) {create(:shop)}
    
    #context "not auth" do
        #describe "create" do
            #it "redirect sign in" do
               # post "/shops/rooms/:room_id/messages", params: params
               # expect(response.status).to redirect_to new_shop_session_path
          #  end
      #  end
   # end
   
   #context "authenticated" do
       #before do
           #sign_in shop
       #end
       
       describe "#create" do
        context "バリデーションエラー" do
            let(:params){ {message: {text: ""}}}
            it "response success" do
                post "/shops/rooms/:room_id/messages", params: params
                expect(response.status).to eq(200)
            end
            
            it "render new" do
                post "/shops/rooms/#{room.id}/messages", params: params
                expect(response.body).to include "New Message"
            end
            
            it "render error" do
                post "/shops/rooms/#{room.id}/messages", params: params
                expect(response.body). to include "Missing create"
            end
        end
        
        context "送信成功" do
            let(:message){build(:message)}
            let(:params) { {message: {text: message.text}} }
            let(:created_message) { Message.last }
            
            it "response redirect" do
                post "/shops/rooms/#{room.id}/messages", params: params
                expect(response.status). to redirect_to shops_item_path(created_item.id)
            end
            
            it "response redirect" do
                expect{
                    post "/shops/items", params: params
                }.to change{ Item.count }.by(1)
            end
        end
    end
   #end
end