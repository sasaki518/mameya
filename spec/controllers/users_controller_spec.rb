require 'rails_helper'

RSpec.describe UsersController, type: :request do
    let(:user) {create(:user)}
    
   describe "#create" do
       context "バリデーションエラー" do
           let(:params){ {user: {name: ""}}}
           it "response success" do
               post "/users", params: params
               expect(response.status).to eq(200)
           end
           
           it "render new" do
               post "/users", params: params
               expect(response.body).to include "サインアップが完了しました"
           end
           
           it "render error" do
               post "/users", params: params
               expect(response.body).to include "サインアップに失敗しました"
           end
       end
       
       context "登録成功" do
            let(:user){build(:user)}
            let(:params) { {user: user.attributes}}
            let(:created_user) { User.last }
            
            it "response redirect" do
                expect{
                    post "/users", params: params
                }.to change{User.count }.by(1)
            end
       end
   end
   end