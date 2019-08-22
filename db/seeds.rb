# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'open-uri'

Cocktail.destroy_all
Dose.destroy_all
Ingredient.destroy_all

# Seed ingredient list
url = 'https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list'
serialized = open(url).read
parse_data = JSON.parse(serialized)

parse_data["drinks"].each do |ingredient|
  Ingredient.create(name: ingredient["strIngredient1"])
end

cocktails = [
  'Final Coffee',
  'Hushed Blast',
  'Wine Shadow',
  'Incredible Eight',
  'Hot Red Wine',
  'Numb Lover',
  'Twisting Kisses',
  'Twisting Volley',
  'Infinite Velour',
  'Tiny Silence',
  'Whipped Tea',
  'Dark Beer Pecker',
  'Gleaming Twister',
  'Imaginary Stardust',
  'Cinnamon Red Wine',
  'Lavish Crystal',
  'Secret Monsoon',
  'Chilled Six',
  'Warm Lord',
  'Lavish Breeze'
]

doses = [
  '1cl',
  '2cl',
  '3cl',
  '4cl',
  '5cl',
  '6cl',
  '7cl',
  '8cl',
  '9cl',
  '10cl'
]

cocktails.each do |cocktail|
  c = Cocktail.create(name: cocktail)
  rand(5).times do
    Dose.create(description: doses.sample, cocktail_id: c.id, ingredient_id: Ingredient.all.sample.id)
  end
end

