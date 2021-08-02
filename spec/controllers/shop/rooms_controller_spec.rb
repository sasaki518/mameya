require 'rails_helper'

RSpec.describe Shops::RoomsController, type: :request do
    let(:room) {create(:room)}
    
    context "not auth" do
        describe "index" do
            it "redirect sign in" do
                get "/shops/rooms"
                expect(response.status).to redirect_to new_shop_session_path
            end
        end
    end
    
    context "authenticated" do
        before do
            sign_in room
        end
        
        describe "#index" do
            context "rooms blank" do
                it "response success" do
                    get "/shops/rooms"
                    expect(response.status).to eq(200)
                end
            end
            
            context "rooms exist" do
                let!(:rooms){create_list(:rooms, 3, shop_id: shop.id, user_id: user.id)}
                it "response success" do
                    get "/shops/rooms"
                    expect(response.status).to eq(200)
                end
                
                it "render rooms" do
                    get "/shops/rooms"
                    rooms.each do |r|
                        expect(response.body).to include room.user_id
                    end
                end
                end
            end
            
            describe "#show" do
                context "target exist" do
                    let!(:room){create(:room)}
                    
                    it "response success" do
                        get "/shops/rooms/#{room.id}"
                        expect (response.status).to eq(200)
                    end
                
                    it "render room" do
                        get "/shops/rooms/#{room.id}"
                        expect(response.body). to include room.user_id
                    end
                end
            
                context "target un exist" do
                    it "response success" do
                        expect{
                            get "shops/rooms/0"
                        }.to raise_error(ActiveRecord::RecordNotFound)
                    end
        end
    end
        end
    end
