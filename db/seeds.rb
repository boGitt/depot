# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Product.delete_all

Product.create(:title => 'Programing Ruby 1.9',
    :description => %{<p>The Ruby language description is here.<p>},
    :image_url => '/images/ruby.jpg',
    :price => 55.6)