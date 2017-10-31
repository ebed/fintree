FactoryGirl.define do
  factory :user do
    sequence(:id) { |n| n }

    factory :valid_user do
      email { "email#{id}@test.com" }
      image { "image#{email}" }
    end

     factory :invalid_email_user do
      email { "email#{id}est.com" }
      image { "image#{email}" }
    end
  end

end
