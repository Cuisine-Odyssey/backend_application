require 'rails_helper'
RSpec.describe Recipe, type: :model do
  describe 'relationships' do
    it { should have_many(:user_recipes) }
    it { should have_many(:users).through(:user_recipes) }
  end

  it '#recipe_total_likes' do
    user_1 = User.create(first_name: 'Chuck', last_name: 'Norris', email: 'chuck@gmail.com')
    user_2 = User.create(first_name: 'Samuel', last_name: 'Jackson', email: 'SammyBoy@gmail.com')
    user_3 = User.create(first_name: 'Will', last_name: 'Ferrel', email: 'the_real_chad_smith@gmail.com')
    user_4 = User.create(first_name: 'Luke', last_name: 'SkyWalker', email: 'the_force@gmail.com')
    user_5 = User.create(first_name: 'Eddie', last_name: 'Murphey', email: 'worst_actor@gmail.com')
    recipe_1 = Recipe.create(recipe_api_id: 13)
    user_recipe_1 = UserRecipe.create(user_id: user_1.id, recipe_id: recipe_1.id, vote: 2)
    user_recipe_2 = UserRecipe.create(user_id: user_2.id, recipe_id: recipe_1.id, vote: 1)
    user_recipe_3 = UserRecipe.create(user_id: user_3.id, recipe_id: recipe_1.id, vote: 1)
    user_recipe_4 = UserRecipe.create(user_id: user_4.id, recipe_id: recipe_1.id, vote: 1)
    user_recipe_5 = UserRecipe.create(user_id: user_5.id, recipe_id: recipe_1.id, vote: 1)
    expect(recipe_1.recipe_total_likes).to eq(4)
  end

  it '#recipe_total_dislikes' do
    user_1 = User.create(first_name: 'Chuck', last_name: 'Norris', email: 'chuck@gmail.com')
    user_2 = User.create(first_name: 'Samuel', last_name: 'Jackson', email: 'SammyBoy@gmail.com')
    user_3 = User.create(first_name: 'Will', last_name: 'Ferrel', email: 'the_real_chad_smith@gmail.com')
    user_4 = User.create(first_name: 'Luke', last_name: 'SkyWalker', email: 'the_force@gmail.com')
    user_5 = User.create(first_name: 'Eddie', last_name: 'Murphey', email: 'worst_actor@gmail.com')
    recipe_1 = Recipe.create(recipe_api_id: 13)
    user_recipe_1 = UserRecipe.create(user_id: user_1.id, recipe_id: recipe_1.id, vote: 2)
    user_recipe_2 = UserRecipe.create(user_id: user_2.id, recipe_id: recipe_1.id, vote: 1)
    user_recipe_3 = UserRecipe.create(user_id: user_3.id, recipe_id: recipe_1.id, vote: 1)
    user_recipe_4 = UserRecipe.create(user_id: user_4.id, recipe_id: recipe_1.id, vote: 1)
    user_recipe_5 = UserRecipe.create(user_id: user_5.id, recipe_id: recipe_1.id, vote: 1)

    expect(recipe_1.recipe_total_dislikes).to eq(1)
  end
end
