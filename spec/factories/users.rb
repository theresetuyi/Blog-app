FactoryBot.define do
    factory :user do
      name { 'Ange' }
      posts_counter { 3 }
      bio { 'Lorem ipsum' }
      photo { 'user.jpg' }
    end
  end