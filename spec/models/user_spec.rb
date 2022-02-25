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

  it '#total_likes' do
    user_1 = User.create(first_name: 'Chuck', last_name: 'Norris', email: 'chuck@gmail.com')
    recipe_1 = Recipe.create(recipe_id: 13)
    recipe_2 = Recipe.create(recipe_id: 21)
    recipe_3 = Recipe.create(recipe_id: 33)
    recipe_4 = Recipe.create(recipe_id: 45)
    recipe_5 = Recipe.create(recipe_id: 512)
    user_recipe_1 = UserRecipe.create(user_id: user_1.id, recipe_id: recipe_1.id, vote: 2)
    user_recipe_2 = UserRecipe.create(user_id: user_1.id, recipe_id: recipe_2.id, vote: 1)
    user_recipe_3 = UserRecipe.create(user_id: user_1.id, recipe_id: recipe_3.id, vote: 0)
    user_recipe_4 = UserRecipe.create(user_id: user_1.id, recipe_id: recipe_4.id, vote: 1)
    user_recipe_5 = UserRecipe.create(user_id: user_1.id, recipe_id: recipe_5.id, vote: 1)

    expect(user_1.total_likes).to eq([recipe_2.recipe_id, recipe_4.recipe_id, recipe_5.recipe_id])
  end

  it '#total_dislikes' do
    user_1 = User.create(first_name: 'Chuck', last_name: 'Norris', email: 'chuck@gmail.com')
    recipe_1 = Recipe.create(recipe_id: 13)
    recipe_2 = Recipe.create(recipe_id: 21)
    recipe_3 = Recipe.create(recipe_id: 33)
    recipe_4 = Recipe.create(recipe_id: 45)
    recipe_5 = Recipe.create(recipe_id: 512)
    user_recipe_1 = UserRecipe.create(user_id: user_1.id, recipe_id: recipe_1.id, vote: 2)
    user_recipe_2 = UserRecipe.create(user_id: user_1.id, recipe_id: recipe_2.id, vote: 1)
    user_recipe_3 = UserRecipe.create(user_id: user_1.id, recipe_id: recipe_3.id, vote: 0)
    user_recipe_4 = UserRecipe.create(user_id: user_1.id, recipe_id: recipe_4.id, vote: 1)
    user_recipe_5 = UserRecipe.create(user_id: user_1.id, recipe_id: recipe_5.id, vote: 1)

    expect(user_1.total_dislikes).to eq([recipe_1.recipe_id])
  end
end
