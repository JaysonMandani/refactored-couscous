FactoryGirl.define do
  factory :user do
    sequence :email do |n|
      "lorem#{n}@example.com"
    end
    first_name 'lorem'
    last_name 'ipsum'
    password   'password'
  end

  factory :post do
    title 'Sample Post'
    body  'lorem ipsum dolor'
    user
  end

  factory :comment do
    body  'lorem ipsum dolor'
    user
    post
  end
end
