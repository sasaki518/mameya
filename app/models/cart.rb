class Cart < ApplicationRecord
    
    has_many :cart_items
    belongs_to :shop
    belongs_to :user
    
    def purchase_message
        text = ""
        text += "#{user.name}様が商品の購入を希望しております。<br>"
        cart_items.each do |ci|
            text += "#{ci.item.name}, #{ci.count}コ<br>"
        end
        text
    end
end
