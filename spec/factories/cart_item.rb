FactoryBot.define do
    factory :cart_item, class: CartItem do
        
        sequence(:count){|c| c % 5 + 1 }
    end
end