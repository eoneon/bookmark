require 'faker'

5.times do
  User.create!(
    email:    Faker::Internet.email,
    password: Faker::Internet.password
  )
end
users = User.all

5.times do
  Topic.create!(
    title:  Faker::Lorem.word
  )
end
topics = Topic.all

5.times do
  Bookmark.create!(
    url:    Faker::Internet.url,
    topic:  topics.sample,
    user:   users.sample
  )
end


puts "Seed finished"
puts "#{User.count} users created"
puts "#{Topic.count} topics created"
puts "#{Bookmark.count} bookmarks created"
