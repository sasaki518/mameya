class Room < ApplicationRecord
    
    has_many :messages
    belongs_to :shop
    belongs_to :user
    
    validates :user_id, :uniqueness => {:scope => :shop_id}
end
