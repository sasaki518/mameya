require "rails_helper"

RSpec.describe Users::CartItemsController, type: :request do
    let(:user) {create(:user)}
    let!(:shop){create(:shop)}
    
    context "authenticated" do
        
        before do
            sign_in user
        end
             
        
        describe "#create" do
            context "バリデーションエラー" do
                let(:params){ {cart_item: {count: ""}} }
                it "response success" do
                    post "/users/cart_items", params: params
                    expect(response.status).to eq(200)
                end
                
                it "render new" do
                    post "/users/cart_items", params: params
                    expect(response.body).to include "商品名"
                end
                
                it "render error" do
                    post "/users/cart_items", params: params
                    expect(response.body).to include "失敗"
                end
            end
            
            context "登録成功" do
                let(:item){create(:item, shop_id: shop.id)}
                let(:cart_item){build(:cart_item, item_id: item.id)}
                let(:params) { {cart_item: cart_item.attributes} }
                
                it "response redirect" do
                    post "/users/cart_items", params: params
                    expect(response.status).to redirect_to users_carts_path
                end
                
                it "response redirect" do
                    expect{
                        post.to change{CartItem.count}.by(1)
                    }
                end
            end
        end
    end
end