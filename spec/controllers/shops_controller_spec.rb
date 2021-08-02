require 'rails_helper'

RSpec.describe ShopsController, type: :request do
    let(:shop){create(:shop)}
    
    describe "#show" do
        context "target exist" do
            let!(:shop){create(:shop)}
            
            it "response success" do
                get "/myshop"
                expect (response.status).to eq(200)
            end
            
            it "render shop" do
                get "/myshop"
                expect(response.body). to include shop.name
            end
        end
        
        context "target un exist" do
            it "response success" do
                expect{
                    get "myshop/0"
                }.to raise_error(ActiveRecord::RecordNotFound)
            end
        end
    end
end