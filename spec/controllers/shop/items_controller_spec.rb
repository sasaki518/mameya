require 'rails_helper'

RSpec.describe Shops::ItemsController, type: :request do
    let(:shop) {create(:shop)}
    
    context "not auth" do
        describe "index" do
            it "redirect sign in" do
                get "/shops/items"
                expect(response.status).to redirect_to new_shop_session_path
            end
        end
    end
    
    context "authenticated" do
            before do
            sign_in shop
        end
    
    
    describe "index" do
        context "items blank" do
            it "response success" do
                get "/shops/items"
                expect(response.status).to eq(200)
            end
        end
        
        context "items exist" do
            let!(:items){create_list(:item, 3, shop_id: shop.id)}
            it "response success" do
                get "/shops/items"
                expect(response.status).to eq(200)
            end
            
            it "render items" do
                get "/shops/items"
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
                get "/shops/items/#{item.id}"
                expect(response.status).to eq(200)
            end
            
            it "render item" do
                get "/shops/items/#{item.id}"
                expect(response.body).to include item.name
            end
        end
        
        context "target un exist" do
            it "response success" do
                expect{
                    get "/shops/items/0"
                }.to raise_error(ActiveRecord::RecordNotFound)
            end
        end
    end
    
    describe "#create" do
        context "バリデーションエラー" do
            let(:params){ {item: {name: ""}}}
            it "response success" do
                post "/shops/items", params: params
                expect(response.status).to eq(200)
            end
            
            it "render new" do
                post "/shops/items", params: params
                expect(response.body).to include "商品登録"
            end
            
            it "render error" do
                post "/shops/items", params: params
                expect(response.body).to include "商品の登録に失敗しました"
            end
        end
        
        context "登録成功" do
            let(:item){build(:item)}
            let(:params) { {item: item.attributes}}
            let(:created_item) { Item.last }
            
            it "response redirect" do
                post "/shops/items", params: params
                expect(response.status).to redirect_to shops_items_path
            end
            
            it "response redirect" do
                expect{
                    post "/shops/items", params: params
                }.to change{ Item.count }.by(1)
            end
        end
    end
    
    describe "#edit" do
        context "item exist" do
            let!(:item){create(:item, shop_id: shop.id)}
            
            it "response success" do
                get "/shops/items/#{item.id}/edit"
                expect(response.status).to eq(200)
            end
            
            it "render item" do
                get "/shops/items/#{item.id}/edit"
                expect(response.body).to include item.name
            end
        end
        
        context "target un exist" do
            it "response success" do
                expect{
                    get "/shops/items/0/edit"
                }.to raise_error(ActiveRecord::RecordNotFound)
            end
        end
    end
    
    describe "#update" do
        context "更新失敗" do
        let(:item) {create(:item, shop_id: shop.id)}
        let(:params) { {item: {name: "", description: item.description}} }

        it "response success" do
          patch "/shops/items/#{item.id}", params: params
          expect(response.status).to eq(200)
        end

        it "render edit" do
          patch "/shops/items/#{item.id}", params: params
          expect(response.body).to include "更新に失敗しました"
        end
      end

      context "更新成功" do
        let(:item) {create(:item, shop_id: shop.id)}
        let(:params) { {item: {name: item.name + " updated", description: item.description}} }

        it "response redirect" do
          patch "/shops/items/#{item.id}", params: params
          expect(response.status).to redirect_to shops_items_path
        end

      end
    end
    
    describe "#destroy" do
      context "削除成功" do
        let!(:item) {create(:item, shop_id: shop.id)}
        it "delete success" do
          expect {
            delete "/shops/items/#{item.id}"
          }.to change{Item.count}.by(-1)
        end

        it "response redirect" do
          delete "/shops/items/#{item.id}"
          expect(response.status).to redirect_to shops_items_path
        end
      end
    end
    end
end