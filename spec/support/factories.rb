FactoryGirl.define do
  factory :user do
    sequence(:email) {|n| "user#{n}@example.com" }
    password "secretpassword"
  end

  factory :todo_list do
    user

    trait :with_todo_items do 
      after(:create) do |todo_list|
        create_list(:todo_item, 2, todo_list: todo_list)
      end
    end
  end

  factory :todo_item do 
    todo_list
    sequence(:desc) {|n| "Todo_item #{n}" }
  end
end