FactoryBot.define do
  factory :comment do
    content 'test comment'
    user_id 1
    post_id 1
  end
end
