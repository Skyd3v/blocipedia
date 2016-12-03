# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# Create Users
25.times do
    pw = Faker::Internet.password(6)
    User.create!(
        email: Faker::Internet.email,
        password: pw,
        password_confirmation: pw
    )
end
users = User.all

# Create Wikis
30.times do
    wiki = Wiki.create!(
        title: Faker::Beer.name,
        body: Faker::ChuckNorris.fact,
        user: users.sample
    )

    wiki.update_attribute(:created_at, rand(10.minutes..1.year).ago)
end
wikis = Wiki.all

# Create a standard member
member = User.create!(
    email: 'member@example.com',
    password: 'helloworld',
    password_confirmation: 'helloworld'
)

# Create an admin user
admin = User.create!(
    email: 'admin@example.com',
    password: 'helloworld',
    password_confirmation: 'helloworld',
    role: 'admin'
)

# Create a premium user
premium = User.create!(
    email: 'premium@example.com',
    password: 'helloworld',
    password_confirmation: 'helloworld',
    role: 'premium'
)

puts 'Seed Complete'
puts "#{User.count} users created"
puts "#{Wiki.count} wikis created"
