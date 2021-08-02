FactoryBot.define do
    
    factory :room, class: Room do
        
        sequence(:shop_id){|r| r % 5 + 1 }
        sequence(:user_id){|r| r % 5 + 1 }
    end
end