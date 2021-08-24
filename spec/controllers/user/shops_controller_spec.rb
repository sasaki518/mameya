require 'rails_helper'

RSpec.describe Users::ShopsController, type: :request do
    let(:user) {create(:user)}
    
    context "not auth" do
        describe "index" do
            it "redirect sign in" do
                get "/users/shops"
                expect(response.status).to redirect_to new_user_session_path
            end
        end
    end
    
    context "authenticated" do
        before do
            sign_in user
        end
        
    describe "index" do
        context "shops blank" do
            it "response success" do
                get "/users/shops"
                expect(response.status).to eq(200)
            end
        end
        
        context "shops exist" do
            let!(:shops){create_list(:shop, 3)}
            it "response success" do
                get "/users/shops"
                expect(response.status).to eq(200)
            end
            
            it "render shops" do
                get "/users/shops"
                shops.each do |s|
                    expect(response.body).to include s.name
                end
            end
        end
    end
    end
end