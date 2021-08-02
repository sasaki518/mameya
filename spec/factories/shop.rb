FactoryBot.define do
    
    factory :shop, class: Shop do
        sequence(:name){ |i| "shop#{i}" }
        sequence(:email){|i| "shop#{i}@example.com" }
        sequence(:password){ "password" }
        sequence(:password_confirmation){ "password" }
    end
end