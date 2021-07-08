class CartItem < ApplicationRecord
    
    belongs_to :cart
    belongs_to :item
    
    validates :item_id, uniqueness: {scope: :cart_id}
    
    
    def sum_of_price
        item.price * count
    end
end
