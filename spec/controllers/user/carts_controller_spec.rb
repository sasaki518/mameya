require 'rails_helper'

RSpec.describe Users::CartsController, type: :request do
    let(:user) {create(:user)}
    
    context "not auth" do
        describe "index" do
            it "redirect sign in" do
                get "/users/carts"
                expect(response.status).to redirect_to new_user_session_path
            end
        end
    end
    
    context "authenticated" do
        before do
            sign_in user
        end
        
        describe "index" do
            context "carts blank" do
                it "response success" do
                    get "/users/carts"
                    expect(response.status).to eq(200)
                end
            end
            
            context "carts exist" do
                let!(:shop){create(:shop)}
                let!(:carts){create_list(:cart, 3, user_id: user.id, shop_id: shop.id)}
                it "response success" do
                    get "/users/carts"
                    expect(response.status).to eq(200)
                end
                
                it "render carts" do
                    get "/users/carts"
                    carts.each do |c|
                        expect(response.body).to include "ショッピングカート"
                    end
                end
            end
        end
    end
end