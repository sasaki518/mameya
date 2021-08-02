FactoryBot.define do
    
    factory :item, class: Item do
        
        sequence(:name){|i| "item#{i}" }
        sequence(:description){|i| "item#{i}" }
        sequence(:price){|i| i * 100 }
        sequence(:gram){|i| i * 100 }
        sequence(:roasting){|i| i % 5 + 1 }
        sequence(:sourness){|i| i % 5 + 1 }
        sequence(:bitterness){|i| i % 5 + 1 }
        sequence(:aroma){|i| i % 5 + 1 }
        sequence(:body){|i| i % 5 + 1 }
        sequence(:aftertaste){|i| i % 5 + 1 }
    end
end