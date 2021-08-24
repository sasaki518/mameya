FactoryBot.define do
    factory :message, class: Message do
        
        sequence(:text){|m| "message#{m}"}
        sequence(:is_user){ true }
    end
end