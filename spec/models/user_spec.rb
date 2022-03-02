require 'rails_helper'
RSpec.describe User, type: :model do
  describe 'relationships' do
    it { should have_many(:user_recipes) }
    it { should have_many(:recipes).through(:user_recipes) }
    it { should have_many(:user_cocktails) }
    it { should have_many(:cocktails).through(:user_cocktails) }
  end

  describe 'validations' do
    it { should validate_presence_of(:first_name) }
    it { should validate_presence_of(:last_name) }
    it { should validate_uniqueness_of(:email) }
  end

  it '#recipe_total_likes' do
    user_1 = User.create(first_name: 'Chuck', last_name: 'Norris', email: 'chuck_8@gmail.com')
    recipe_1 = Recipe.create(recipe_api_id: 13)
    recipe_2 = Recipe.create(recipe_api_id: 21)
    recipe_3 = Recipe.create(recipe_api_id: 33)
    recipe_4 = Recipe.create(recipe_api_id: 45)
    recipe_5 = Recipe.create(recipe_api_id: 512)
    user_recipe_1 = UserRecipe.create(user_id: user_1.id, recipe_id: recipe_1.id, vote: 2)
    user_recipe_2 = UserRecipe.create(user_id: user_1.id, recipe_id: recipe_2.id, vote: 1)
    user_recipe_3 = UserRecipe.create(user_id: user_1.id, recipe_id: recipe_3.id, vote: 0)
    user_recipe_4 = UserRecipe.create(user_id: user_1.id, recipe_id: recipe_4.id, vote: 1)
    user_recipe_5 = UserRecipe.create(user_id: user_1.id, recipe_id: recipe_5.id, vote: 1)

    expect(user_1.recipe_total_likes).to eq([recipe_2.recipe_api_id, recipe_4.recipe_api_id, recipe_5.recipe_api_id])
  end

  it '#recipe_total_dislikes' do
    user_1 = User.create(first_name: 'Chuck', last_name: 'Norris', email: 'chuck_9@gmail.com')
    recipe_1 = Recipe.create(recipe_api_id: 13)
    recipe_2 = Recipe.create(recipe_api_id: 21)
    recipe_3 = Recipe.create(recipe_api_id: 33)
    recipe_4 = Recipe.create(recipe_api_id: 45)
    recipe_5 = Recipe.create(recipe_api_id: 512)
    user_recipe_1 = UserRecipe.create(user_id: user_1.id, recipe_id: recipe_1.id, vote: 2)
    user_recipe_2 = UserRecipe.create(user_id: user_1.id, recipe_id: recipe_2.id, vote: 1)
    user_recipe_3 = UserRecipe.create(user_id: user_1.id, recipe_id: recipe_3.id, vote: 0)
    user_recipe_4 = UserRecipe.create(user_id: user_1.id, recipe_id: recipe_4.id, vote: 1)
    user_recipe_5 = UserRecipe.create(user_id: user_1.id, recipe_id: recipe_5.id, vote: 1)

    expect(user_1.recipe_total_dislikes).to eq([recipe_1.recipe_api_id])
  end

  it '#cocktail_total_likes' do
    user_1 = User.create(first_name: 'Chuck', last_name: 'Norris', email: 'chuck_10@gmail.com')
    cocktail_1 = Cocktail.create(cocktail_api_id: 13)
    cocktail_2 = Cocktail.create(cocktail_api_id: 21)
    cocktail_3 = Cocktail.create(cocktail_api_id: 33)
    cocktail_4 = Cocktail.create(cocktail_api_id: 45)
    cocktail_5 = Cocktail.create(cocktail_api_id: 512)
    user_cocktail_1 = UserCocktail.create(user_id: user_1.id, cocktail_id: cocktail_1.id, vote: 2)
    user_cocktail_2 = UserCocktail.create(user_id: user_1.id, cocktail_id: cocktail_2.id, vote: 1)
    user_cocktail_3 = UserCocktail.create(user_id: user_1.id, cocktail_id: cocktail_3.id, vote: 0)
    user_cocktail_4 = UserCocktail.create(user_id: user_1.id, cocktail_id: cocktail_4.id, vote: 1)
    user_cocktail_5 = UserCocktail.create(user_id: user_1.id, cocktail_id: cocktail_5.id, vote: 1)

    expect(user_1.cocktail_total_likes).to eq([cocktail_2.cocktail_api_id, cocktail_4.cocktail_api_id, cocktail_5.cocktail_api_id])
  end

  it '#cocktail_total_dislikes' do
    user_1 = User.create(first_name: 'Chuck', last_name: 'Norris', email: 'chuck_11@gmail.com')
    cocktail_1 = Cocktail.create(cocktail_api_id: 13)
    cocktail_2 = Cocktail.create(cocktail_api_id: 21)
    cocktail_3 = Cocktail.create(cocktail_api_id: 33)
    cocktail_4 = Cocktail.create(cocktail_api_id: 45)
    cocktail_5 = Cocktail.create(cocktail_api_id: 512)
    user_cocktail_1 = UserCocktail.create(user_id: user_1.id, cocktail_id: cocktail_1.id, vote: 2)
    user_cocktail_2 = UserCocktail.create(user_id: user_1.id, cocktail_id: cocktail_2.id, vote: 1)
    user_cocktail_3 = UserCocktail.create(user_id: user_1.id, cocktail_id: cocktail_3.id, vote: 0)
    user_cocktail_4 = UserCocktail.create(user_id: user_1.id, cocktail_id: cocktail_4.id, vote: 1)
    user_cocktail_5 = UserCocktail.create(user_id: user_1.id, cocktail_id: cocktail_5.id, vote: 1)

    expect(user_1.cocktail_total_dislikes).to eq([cocktail_1.cocktail_api_id])
  end
end
