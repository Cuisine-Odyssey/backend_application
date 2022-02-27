# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.destroy_all
Recipe.destroy_all
UserRecipe.destroy_all

user_1 = User.create(first_name: 'Chuck', last_name: 'Norris', email: 'chuck@gmail.com')
user_2 = User.create(first_name: 'Samuel', last_name: 'Jackson', email: 'SammyBoy@gmail.com')
user_3 = User.create(first_name: 'Will', last_name: 'Ferrel', email: 'the_real_chad_smith@gmail.com')
user_4 = User.create(first_name: 'Luke', last_name: 'SkyWalker', email: 'the_force@gmail.com')
user_5 = User.create(first_name: 'Eddie', last_name: 'Murphey', email: 'worst_actor@gmail.com')
user_6 = User.create(first_name: 'Owen', last_name: 'Wilson', email: 'marleyandme@gmail.com')
user_7 = User.create(first_name: 'Jerry', last_name: 'Garcia', email: 'direwolf@gmail.com')
user_8 = User.create(first_name: 'Han', last_name: 'Solo', email: 'milleniumfalcon@gmail.com')
user_9 = User.create(first_name: 'Chew', last_name: 'Bacca', email: 'wookie@gmail.com')
user_10 = User.create(first_name: 'Bob', last_name: 'Weir', email: 'TheOtherOne@gmail.com')
user_11 = User.create(first_name: 'Jimi', last_name: 'Hendrix', email: 'purplehaze@gmail.com')

recipe_1 = Recipe.create(recipe_api_id: 13)
recipe_2 = Recipe.create(recipe_api_id: 21)
recipe_3 = Recipe.create(recipe_api_id: 33)
recipe_4 = Recipe.create(recipe_api_id: 45)
recipe_5 = Recipe.create(recipe_api_id: 512)
recipe_6 = Recipe.create(recipe_api_id: 632)
recipe_7 = Recipe.create(recipe_api_id: 7231)
recipe_8 = Recipe.create(recipe_api_id: 8123)
recipe_9 = Recipe.create(recipe_api_id: 932)
recipe_10 = Recipe.create(recipe_api_id: 10123)
recipe_11 = Recipe.create(recipe_api_id: 1112)
recipe_12 = Recipe.create(recipe_api_id: 1233)
recipe_13 = Recipe.create(recipe_api_id: 1355)


user_recipe_1 = UserRecipe.create(user_id: user_1.id, recipe_id: recipe_1.id, vote: 2)
user_recipe_2 = UserRecipe.create(user_id: user_1.id, recipe_id: recipe_2.id, vote: 1)
user_recipe_3 = UserRecipe.create(user_id: user_1.id, recipe_id: recipe_5.id, vote: 0)
user_recipe_4 = UserRecipe.create(user_id: user_2.id, recipe_id: recipe_2.id, vote: 1)
user_recipe_5 = UserRecipe.create(user_id: user_2.id, recipe_id: recipe_1.id, vote: 1)
user_recipe_6 = UserRecipe.create(user_id: user_3.id, recipe_id: recipe_1.id, vote: 0)

cocktail_1 = Cocktail.create(cocktail_api_id: 13)
cocktail_2 = Cocktail.create(cocktail_api_id: 21)
cocktail_3 = Cocktail.create(cocktail_api_id: 33)
cocktail_4 = Cocktail.create(cocktail_api_id: 45)
cocktail_5 = Cocktail.create(cocktail_api_id: 512)
cocktail_6 = Cocktail.create(cocktail_api_id: 632)
cocktail_7 = Cocktail.create(cocktail_api_id: 7231)
cocktail_8 = Cocktail.create(cocktail_api_id: 8123)
cocktail_9 = Cocktail.create(cocktail_api_id: 932)
cocktail_10 = Cocktail.create(cocktail_api_id: 10123)
cocktail_11 = Cocktail.create(cocktail_api_id: 1112)
cocktail_12 = Cocktail.create(cocktail_api_id: 1233)
cocktail_13 = Cocktail.create(cocktail_api_id: 1355)

user_cocktail_1 = UserCocktail.create(user_id: user_1.id, cocktail_id: cocktail_1.id, vote: 2)
user_cocktail_2 = UserCocktail.create(user_id: user_1.id, cocktail_id: cocktail_2.id, vote: 1)
user_cocktail_3 = UserCocktail.create(user_id: user_1.id, cocktail_id: cocktail_5.id, vote: 0)
user_cocktail_4 = UserCocktail.create(user_id: user_2.id, cocktail_id: cocktail_2.id, vote: 1)
user_cocktail_5 = UserCocktail.create(user_id: user_2.id, cocktail_id: cocktail_1.id, vote: 1)
user_cocktail_6 = UserCocktail.create(user_id: user_3.id, cocktail_id: cocktail_1.id, vote: 0)
