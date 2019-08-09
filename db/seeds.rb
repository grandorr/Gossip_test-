Comment.destroy_all
Gossip.destroy_all
User.destroy_all
City.destroy_all

  city = City.create(name: "Marseille")
  city = City.create(name: "Paris")
  city = City.create(name: "Toulon")
  city = City.create(name: "Nice")


20.times do
c = User.create(username: "noob",password: "noob",city: City.all.sample,first_name: Faker::Name.first_name , last_name: Faker::Name.last_name, description: Faker::Quote.yoda,email: Faker::Internet.email,age: rand(8..99))
g = Gossip.create(title: Faker::Cosmere.shard,content:  Faker::Quote.yoda, user: c )
co = Comment.create(content: "Merci", gossip: g, user: c)
g = Gossip.create(title: Faker::Cosmere.shard,content:  Faker::Quote.yoda, user: c )
co = Comment.create(content: "Merci", gossip: g, user: c)

end
