FactoryGirl.define do
  factory :topic do
    title { RandomData.random_word }
    user nil
  end
end
