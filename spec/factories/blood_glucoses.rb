FactoryGirl.define do
  factory :blood_glucose do
    level '120'
    check_up_date '2016/06/08'
    association :user, factory: :user
  end
end
