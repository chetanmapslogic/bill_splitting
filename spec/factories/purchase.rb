FactoryGirl.define do
  factory :purchase do
    date_purchased '09/19/2017'
    location 'Mumbai'
    cost 50
    event_id 1
    id 1
    # user_ids [3]
  end
end