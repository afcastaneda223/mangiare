# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create!(email: 'a@a.com',
             password: '123456',
             password_confirmation: '123456',
             admin: true)

Category.create(heading: 'Pizza', body: 'its so good', display: true)
Category.create(heading: 'Pasta', body: 'its a pasta', display: true)
Category.create(heading: 'Postres', body: 'son los postres', display: true)

9.times do |i|
  pizza = Product.new(
    name: "#{i}_pizza",
    description: 'loren ipsun bbq pizza',
    price: '12000',
    catering: true,
    category: Category.find(1)
  )
  pasta = Product.new(
    name: "#{i}_pasta",
    description: 'loren ipsun bbq pizza',
    price: '10000',
    catering: true,
    category: Category.find(2)
  )
  postre = Product.new(
    name: "#{i}_postre",
    description: 'loren ipsun bbq pizza',
    price: '9000',
    catering: true,
    category: Category.find(3)
  )
  pizza.image.attach(io: open('https://picsum.photos/1920/1080'), filename: "#{i}_pizza_image.jpg")
  pasta.image.attach(io: open('https://picsum.photos/1920/1080'), filename: "#{i}_pasta_image.jpg")
  postre.image.attach(io: open('https://picsum.photos/1920/1080'), filename: "#{i}_postre_image.jpg")

  if i == 1
    pizza.featured = true
    pasta.featured = true
    postre.featured = true
  end
  pizza.save
  pasta.save
  postre.save
end
