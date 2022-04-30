# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
puts "Destroying all data"
Critic.destroy_all
InvolvedCompany.destroy_all
Game.destroy_all
Genre.destroy_all
Platform.destroy_all
Company.destroy_all
User.destroy_all
puts "Finish"

######################
# Start seeding User
puts "Start seeding User"
20.times do |n|
  v_user = Faker::Internet.user('username', 'email')
  user  = User.new( v_user )
  if user.valid?
    user.save
  else
    puts "Cannot create user #{v_user}"
  end
end
puts "Finish seeding Users"

# ######################
# # Start seeding Companies
puts "Start seeding Companies"
10.times do |n|
  company = Company.new( name: Faker::Company.name,  description: Faker::Lorem.paragraph, start_date: Faker::Date.between(from: '1900-01-01', to: Time.zone.now), country: Faker::Address.country )
  if company.valid?
    company.save
    company.cover.attach(io: File.open("db/img/company #{n + 1}.png"), filename: "company #{n + 1}.png")
  else
    puts "Cannot create company #{company}"
  end
end
puts "Finish seeding Companies"
#   # company.critic.create(
#   #   title: Faker::Lorem.sentence,
#   #   body: Faker::Lorem.paragraph,
#   #   user: user
#   # )

# ######################
puts "Start seeding Platform"
# Start seeding Platform
5.times do |n|
  platform = Platform.new( name: Faker::Game.platform, category: (0..5).to_a.sample )
  if platform.valid?
    platform.save
  else
    puts "Cannot create platform #{platform}"
  end
end
puts "Finish seeding Platform"
# Finish seeding Platform

# ######################
puts "Start seeding Genre"
# Start seeding Genre
# 5 --> randomly chosen number
5.times do |n|
  genre = Genre.new( name: Faker::Game.genre )
  if genre.valid?
    genre.save
  else
    puts "Cannot create genre #{company}"
  end
end
puts "Finish seeding Genre"
# Finish seeding Genre

# ######################
puts "Start seeding Games"
# Start seeding Games
# Ternary operator are placed because the last game will be an expansion of the first one.
30.times do |n|
  category = rand(0..1)
  game = Game.new(
    name: Faker::Game.title,
    summary: Faker::Lorem.paragraph,
    release_date: Faker::Date.between(from: '1990-01-01', to: Time.zone.now),
    category: category,
    rating: rand(1.0..100.0).round(1),
    parent: category == 1 ? Game.all.sample : nil
  )
  if game.valid?
    game.save
    game_number = rand(1..3)
    game.cover.attach(io: File.open("db/img/game #{game_number}.png"), filename: "game #{game_number}.png")
    # Adding involved_companies relation
    3.times do 
      game.involved_companies.create(company: Company.all.sample, developer: [true, false].sample, publisher: [true, false].sample )
    end
  else
    puts "Cannot create game #{game}"
  end
end
#   game.cover.attach(io: File.open("db/img/company #{n + 1}.png"), filename: "company #{n + 1}.png")
#   # game.critic.create(
#   #   title: Faker::Lorem.sentence,
#   #   body: Faker::Lorem.paragraph,
#   #   user: user
#   # )
# end
puts "Finish seeding Games"
# Finish seeding Games


# ########################################### 
puts "Start seeding Critic"
# # Start seeding Critic
60.times do 
  user = User.all.sample
  5.times do
    user_critic = user.critics.new(
      title: Faker::Hipster.sentence(word_count: 4), 
      body: Faker::Hipster.paragraph_by_chars(characters: 200), 
      criticable: rand(0..1) == 0 ? Company.all.sample : Game.all.sample)
    
    if user_critic.valid?
      user_critic.save
    else
      puts user_critic.errors.full_messages
    end
  end
end

puts "Finish seeding Critic"
# Finish seeding Critic
