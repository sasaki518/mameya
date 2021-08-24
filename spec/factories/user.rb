FactoryBot.define do
    
    factory :user, class: User do
        sequence(:name){ |u| "user#{u}" }
        sequence(:email){ |u| "user#{u}@example.com" }
        sequence(:password){ "password" }
        sequence(:password_confirmation){ "password" }
    end
    
end