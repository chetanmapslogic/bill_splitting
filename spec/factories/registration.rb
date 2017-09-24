FactoryGirl.define do
  factory :user do
    username 'amar'
    email 'example@gmail.com'
    password 'password'
    password_confirmation 'password'
  end
end