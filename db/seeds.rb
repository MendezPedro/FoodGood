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
photo_locals = ["https://ripleycl.imgix.net/http%3A%2F%2Fs3.amazonaws.com%2Fimagenes-sellers-mercado-ripley%2F2021%2F01%2F15092323%2F4.00-x-2.40-I.jpeg?w=750&h=555&ch=Width&auto=format&cs=strip&bg=FFFFFF&q=60&trimcolor=FFFFFF&trim=color&fit=fillmax&ixlib=js-1.1.0&s=1774c5383a6f2fb083d035f200df9e48","https://media.cdn.puntobiz.com.ar/102018/1617330765635.webp?cw=984&ch=553&extw=jpg","https://cdn0.matrimonios.cl/vendor/8199/3_2/1280/jpg/img-20151205-wa0010_8_118199.jpeg","https://i.pinimg.com/originals/ce/91/50/ce9150b7e9c4eceb8da7f83554abdaa4.jpg","http://imgcf.ecn.cl/600/85/855808c3b1afa8375a4cf04cc07e01923cb898eb.bin.jpg","https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRr2nAIRtKLjjMNE7rfAzfevYhhJbSVcNu3n9DSXWMRftWjhcu-QSppf4-w143xkXbFMLI&usqp=CAU","https://images.evisos.cl/2015/02/03/local-especial-para-completosbebidaschurrascos_8c75c56f13_3.jpg"]
name_locals = ["foodtruck","Mundo donas","PopCorn","Churros express","Sopaipillas de la abuela","Dilly Dilly","Completitos"]
fast_food = ["Completos","Churrascos","Sushi","Cabritas","Helados","Sopaipillas","Pollo","Papas Fritas"]
5.times do
    7.times do |x|
        FoodStore.create(
            name: name_locals[x],
            address: Faker::Address.street_address,
            schedule: Time.now.strftime("%H:%M"),
            products: "#{fast_food.sample},#{fast_food.sample} y #{fast_food.sample}.",
            closing: "00:00",
            photo: photo_locals[x]
        )
    end
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



