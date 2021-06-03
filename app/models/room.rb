class Room < ApplicationRecord
    
    has_many :messages
    belongs_to :shop
    belongs_to :user
end
