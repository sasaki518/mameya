class UserMailer < ApplicationMailer
   default from: 'notifications@example.com'
   
    def send_confirm_to_user(user)
       @user = user
       mail(
           subject: "会員登録が完了しました。",
           to: "送信先のメールアドレス"
           ) do |format|
               format.text
           end
    end
           
end
