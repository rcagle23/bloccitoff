require 'faker'

# Create Items
10.times do
Item.create!(
 user: User.first,
 name:  Faker::Lorem.sentence,
)
end

puts "Seed finished"
puts "#{Item.count} to-do items created"