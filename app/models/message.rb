class Message < ApplicationRecord
    
    belongs_to :room
    
    validates :text, presence: true
        
end
