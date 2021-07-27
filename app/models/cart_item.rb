class CartItem < ApplicationRecord
    
    belongs_to :cart
    belongs_to :item
    
    validates :item_id, uniqueness: {scope: :cart_id}
    validates :count, presence: true, numericality: { maximum: 10, only_integer: true}
    
    
    def sum_of_price
        item.price * count
    end
end
