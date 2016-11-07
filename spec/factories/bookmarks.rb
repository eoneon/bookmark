FactoryGirl.define do
  factory :bookmark do
    url RandomData.random_word
    topic
    user
  end
end
