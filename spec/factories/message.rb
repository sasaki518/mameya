FactoryBot.define do
    factory :messsage, class: Message do
        
        sequence(:text)
        sequence(:room_id)
        sequence(:is_user)
    end
end