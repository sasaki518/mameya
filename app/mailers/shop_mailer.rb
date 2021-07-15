class ShopMailer < ApplicationMailer
    default from: 'notification@examile.com'
    
    def send_message_to_shop(shop)
        @shop = shop
        mail(
           subject: "ユーザーからメッセージが届きました。",
           to: @shop.email
           ) do |format|
               format.text
           end
    end
end
