FactoryGirl.define do

  factory :user do
    sequence(:email) {|n| "dean_#{n}_winchester@email.com"}
    sequence(:display_name) { |n| "dean_#{n}_winchester" }
    password 'password'
    password_confirmation 'password'
  end

end
