FactoryBot.define do
  factory :post do
    sequence(:title) { |n| "Post #{n}" }
    text { 'Lorem ipsum' }
    association :author, factory: :user
  end
end
