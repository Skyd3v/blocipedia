# Create Users
userArray = []
25.times do
    pw = Faker::Internet.password(6)
    userArray << {
        email: Faker::Internet.email,
        password: pw,
        password_confirmation: pw
    }
end
users = User.create!(userArray)

# Create Wikis
wikiArray = []
30.times do
    wikiArray << {
        title: Faker::Beer.name,
        body: Faker::ChuckNorris.fact,
        user: users.sample
    }
end
wikis = Wiki.create!(wikiArray)

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
