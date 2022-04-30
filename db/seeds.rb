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
user = User.create(
  username: "test2" ,
  email: "test2@mail.com",
)
puts "Finish seeding User"
# Finish seeding User
######################
puts "Start seeding Companies"
# Start seeding Companies
3.times do |n|
  company = Company.create(
    name: Faker::Company.name, 
    description: Faker::Lorem.paragraph,
    start_date: Faker::Date.between(from: '1900-01-01', to: Time.zone.now),
    country: Faker::Address.country,
  )
  company.cover.attach(io: File.open("db/img/game #{n + 1}.png"), filename: "game #{n + 1}.png")
  # company.critic.create(
  #   title: Faker::Lorem.sentence,
  #   body: Faker::Lorem.paragraph,
  #   user: user
  # )
end
puts "Finish seeding Companies"
# Finish seeding Companies
######################
puts "Start seeding Platform"
# Start seeding Platform
5.times do |n|
  platform = Platform.create(
    name: Faker::Game.platform,
    category: (0..5).to_a.sample
  )
end
puts "Finish seeding Platform"
# Finish seeding Platform
######################
puts "Start seeding Genre"
# Start seeding Genre
# 5 --> randomly chosen number
5.times do |n|
  genre = Genre.create(
    name: Faker::Game.genre
  )
end
puts "Finish seeding Genre"
# Finish seeding Genre
######################
puts "Start seeding Games"
# Start seeding Games
# Ternary operator are placed because the last game will be an expansion of the first one.
3.times do |n|
  game = Game.create(
    name: Faker::Game.title,
    summary: Faker::Lorem.paragraph,
    release_date: Faker::Date.between(from: '1990-01-01', to: Time.zone.now),
    category: n == 2 ? 1 : 0,
    rating: rand(1.0..100.0).round(1),
    parent: n == 2 ? Game.first : nil
  )
  game.cover.attach(io: File.open("db/img/company #{n + 1}.png"), filename: "company #{n + 1}.png")
  # game.critic.create(
  #   title: Faker::Lorem.sentence,
  #   body: Faker::Lorem.paragraph,
  #   user: user
  # )
end
puts "Finish seeding Games"
# Finish seeding Games
######################
puts "Start seeding InvolvedCompany"
# Start seeding InvolvedCompany
3.times do |n|
  company = [Company.first, Company.second, Company.third][n]
  game = [Game.first, Game.second, Game.third][n]
  inv_comp = InvolvedCompany.create(
    company: company,
    game: game,
    developer: [false, true].sample,
    publisher: [false, true].sample,
  )
end
puts "Finish seeding InvolvedCompany"
# Finish seeding InvolvedCompany
######################
puts "Start seeding Critic"
# Start seeding Critic
########################################### Error al tratar de vincular critics con games y company
critic = Critic.create(
  title: Faker::Lorem.sentence,
  body: Faker::Lorem.paragraph,
  user: user
)
puts "Finish seeding Critic"
# Finish seeding Critic

