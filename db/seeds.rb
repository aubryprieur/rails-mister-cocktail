# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Dose.destroy_all
Ingredient.destroy_all
Cocktail.destroy_all


require 'open-uri'
require 'json'
require 'pry-byebug'

result = JSON.parse(open("http://www.thecocktaildb.com/api/json/v1/1/list.php?i=list").read)
i = 0
result['drinks'].each do |element|
  name = element['strIngredient1']
  Ingredient.create!(name: name)
  i += 1
  break if i > 20
end

c1 = Cocktail.create(name: 'mojito')
d1 = Dose.create(description: '2cl', cocktail_id: c1.id, ingredient_id: Ingredient.first.id)

c2 = Cocktail.create(name: 'Sazerac')
d2 = Dose.create(description: '4cl', cocktail_id: c2.id, ingredient_id: Ingredient.last.id)

c3 = Cocktail.create(name: 'Down Home Punch')
d3 = Dose.create(description: '6cl', cocktail_id: c3.id, ingredient_id: Ingredient.first.id)
