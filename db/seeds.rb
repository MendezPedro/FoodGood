# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

#elimina para no crear varios registros repetidos al ejecutar el seed
Category.destroy_all
User.destroy_all

x=1
5.times do

    User.create(
        email: "#{x}@gmail.com",
        name: Faker::TvShows::Simpsons.character,
        avatar: Faker::Avatar.image,
        password: "123456")
    x=x+1
end

# 6.times do
#     Category.create(
#         title: Faker::TvShows::Simpsons.location
#     )
# end

# 14.times do
#     Category.create(
#         title: Faker::TvShows::Simpsons.location,
#         category_id: Random.rand(1..6)
#     )
# end

