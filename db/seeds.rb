# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

#elimina para no crear varios registros repetidos al ejecutar el seed

User.destroy_all
FoodStore.destroy_all
Post.destroy_all
Comment.destroy_all
Category.destroy_all


2.times do |x|

    User.create(
        email: "#{x + 1}@gmail.com",
        name: Faker::TvShows::Simpsons.character,
        avatar: Faker::Avatar.image,
        admin: true,
        password: "123456")
    
end

8.times do |x|

    User.create(
        email: "#{x + 3}@gmail.com",
        name: Faker::TvShows::Simpsons.character,
        avatar: Faker::Avatar.image,
        admin: false,
        password: "123456")
    
end

30.times do
    Category.create(
        title: Faker::Food.fruits
    )
end

100.times do
    Category.create(
        title: Faker::TvShows::Simpsons.location,
        category_id: Category.all.pluck("id").sample
    )
end

50.times do
    FoodStore.create(
        name: Faker::Music::RockBand.name,
        latitude: Faker::Address.latitude,
        longitude: Faker::Address.longitude,
        day_open: Time.zone.local(2021, 7, 11),
        schedule: Time.now.strftime("%H:%M"),
        photo: Faker::Avatar.image
    )
end

50.times do
    Post.create(
        title: Faker::Food.fruits,
        user_id:User.all.pluck("id").sample,
        category_id:Category.all.pluck("id").sample,
        food_store_id:FoodStore.all.pluck("id").sample,
        content: Faker::Quotes::Shakespeare.hamlet_quote,
        rating: Random.rand(1..5)
    )
end

50.times do
    Comment.create(
        user_id: User.all.pluck("id").sample,
        content: Faker::Quote.yoda,
        likes: Random.rand(1..3),
        post_id: Post.all.pluck("id").sample,
    )
end



