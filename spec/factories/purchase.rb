FactoryGirl.define do
  factory :purchase do
    date_purchased '09/19/2017'
    location 'Mumbai'
    cost 50
    event_id 1
    purchase_user_ids_2 [2,3]
  end
end