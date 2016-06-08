FactoryGirl.define do
  factory :user do
    email "user@example.com"
    password "secretpassword"
  end

  factory :todo_list do
    user
  end
end