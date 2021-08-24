require 'rails_helper'

RSpec.describe Users::ItemsController, type: :request do
    let(:user) {create(:user)}
     let!(:shop){create(:shop)}
    
    context "not auth" do
        describe "index" do
            it "rediirect sign in" do
                get "/users/shops/#{shop.id}/items"
                expect(response.status).to redirect_to new_user_session_path
            end
        end
    end
    
    context "authenticated" do
        before do
            sign_in user
        end
        
    describe "#index" do
        context "items blank" do
     
            it "response success" do
                get "/users/shops/#{shop.id}/items"
                expect(response.status).to eq(200)
            end
        end
        
        context "items exist" do
       
            let!(:items){create_list(:item, 3, shop_id: shop.id)}
            it "response success" do
                get "/users/shops/#{shop.id}/items"
                expect(response.status).to eq(200)
            end
            
            it "render items" do
                get "/users/shops/#{shop.id}/items"
                items.each do |i|
                    expect(response.body).to include i.name
                end
            end
        end
    end
    
    describe "#show" do
        context "target exist" do
            let!(:item){create(:item, shop_id: shop.id)}
            
            it "response success" do
                get "/users/shops/#{shop.id}/items/#{item.id}"
                expect(response.status).to eq(200)
            end
            
            it "render item" do
                get "/users/shops/#{shop.id}/items/#{item.id}"
                expect(response.body).to include item.name
            end
        end
        
        context "target un exist" do
            it "response success" do
                expect{
                    get "/users/shops/#{shop.id}/items/0"
                }.to raise_error(ActiveRecord::RecordNotFound)
            end
        end
    end
    end
end