require "rails_helper"

RSpec.describe HomesController, type: :request do

    describe "#lp" do
        it "response success" do
            get "/homes/users"
            expect(response.status).to eq(200)
        end
    end
    
    describe "#lp2" do
        it "response success" do
            get "/homes/shops"
            expect(response.status).to eq(200)
        end
    end
end