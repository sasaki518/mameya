class UserMailer < ApplicationMailer
   default from: 'notifications@example.com'
   
    def send_confirm_to_user(user)
       @user = user
       mail(
           subject: "会員登録が完了しました。",
           to: @user.email
           ) do |format|
               format.text
           end
    end
    
    def send_message_to_user(user, shop)
        @user = user
        @shop = shop
        mail(
           subject: "ショップからメッセージが届きました。",
           to: @user.email
           ) do |format|
               format.text
           end
    end
    
    def send_purchase_confirmation_to_user(user, shop)
        @user = user
        @shop = shop
        mail(
           subject: "購入が完了しました。",
           to: @user.email
           ) do |format|
               format.text
           end
    end
end
