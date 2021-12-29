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
        admin: true,
        password: "123456")
    
end

8.times do |x|

    User.create(
        email: "#{x + 3}@gmail.com",
        name: Faker::TvShows::Simpsons.character,
        admin: false,
        password: "123456")
    
end

categorias = ["Frutas","Almuerzos","Bebestibles","Helados","Comida rapida","Dulces"]

6.times do |x|
    Category.create(
        title: categorias[x]
    )
end

sub_categorias = ["Pizza","Completos","Hamburguesas","Sandwiches","Snaks","Donas","Empanadas"]
7.times do |x|
    Category.create(
        title: sub_categorias[x],
        category_id: Category.all.pluck("id")[5],
    )
end

fast_food = ["Completos","Churrascos","Sushi","Cabritas","Helados","Sopaipillas","Pollo","Papas Fritas"]
50.times do
    FoodStore.create(
        name: Faker::Music::RockBand.name,
        address: Faker::Address.street_address,
        schedule: Time.now.strftime("%H:%M"),
        products: "#{fast_food.sample},#{fast_food.sample} y #{fast_food.sample}.",
        closing: "00:00",
        photo: "http://imgcf.ecn.cl/600/8a/8a167b72f1c997639c821688fc2aa088960a8355.bin.jpg"
    )
end

100.times do
    Post.create(
        title: Faker::Creature::Animal.name,
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



