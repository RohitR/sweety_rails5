FactoryGirl.define do
  factory :user do
    sequence(:email) { |n| "example#{n}@domain.com" }
    password 'password'
    factory :patient_user do
      type 'User::Patient'
    end
  end

  factory :user_sign_up, :class => User do
    sequence(:email) { |n| "example#{n}@signupdomain.com" }
    password 'password'
    factory :patient_sign_up do
     type 'User::Patient'
    end
  end
end
