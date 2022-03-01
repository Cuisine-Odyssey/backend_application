require 'rails_helper'
RSpec.describe Cocktail, type: :model do
  describe 'relationships' do
    it { should have_many(:user_cocktails) }
    it { should have_many(:users).through(:user_cocktails)}
  end

  it '#cocktail_total_likes' do
    user_1 = User.create(first_name: 'Chuck', last_name: 'Norris', email: 'chuck_14@gmail.com')
    user_2 = User.create(first_name: 'Samuel', last_name: 'Jackson', email: 'SammyBoy_14@gmail.com')
    user_3 = User.create(first_name: 'Will', last_name: 'Ferrel', email: 'the_real_chad_smith_14@gmail.com')
    user_4 = User.create(first_name: 'Luke', last_name: 'SkyWalker', email: 'the_force_14@gmail.com')
    user_5 = User.create(first_name: 'Eddie', last_name: 'Murphey', email: 'worst_actor_14@gmail.com')
    cocktail_1 = Cocktail.create(cocktail_api_id: 13)
    user_cocktail_1 = UserCocktail.create(user_id: user_1.id, cocktail_id: cocktail_1.id, vote: 2)
    user_cocktail_2 = UserCocktail.create(user_id: user_2.id, cocktail_id: cocktail_1.id, vote: 1)
    user_cocktail_3 = UserCocktail.create(user_id: user_3.id, cocktail_id: cocktail_1.id, vote: 1)
    user_cocktail_4 = UserCocktail.create(user_id: user_4.id, cocktail_id: cocktail_1.id, vote: 1)
    user_cocktail_5 = UserCocktail.create(user_id: user_5.id, cocktail_id: cocktail_1.id, vote: 1)
    expect(cocktail_1.cocktail_total_likes).to eq(4)
  end

  it '#cocktail_total_dislikes' do
    user_1 = User.create(first_name: 'Chuck', last_name: 'Norris', email: 'chuck_15@gmail.com')
    user_2 = User.create(first_name: 'Samuel', last_name: 'Jackson', email: 'SammyBoy_15@gmail.com')
    user_3 = User.create(first_name: 'Will', last_name: 'Ferrel', email: 'the_real_chad_smith_15@gmail.com')
    user_4 = User.create(first_name: 'Luke', last_name: 'SkyWalker', email: 'the_force_15@gmail.com')
    user_5 = User.create(first_name: 'Eddie', last_name: 'Murphey', email: 'worst_actor_15@gmail.com')
    cocktail_1 = Cocktail.create(cocktail_api_id: 13)
    user_cocktail_1 = UserCocktail.create(user_id: user_1.id, cocktail_id: cocktail_1.id, vote: 2)
    user_cocktail_2 = UserCocktail.create(user_id: user_2.id, cocktail_id: cocktail_1.id, vote: 1)
    user_cocktail_3 = UserCocktail.create(user_id: user_3.id, cocktail_id: cocktail_1.id, vote: 1)
    user_cocktail_4 = UserCocktail.create(user_id: user_4.id, cocktail_id: cocktail_1.id, vote: 1)
    user_cocktail_5 = UserCocktail.create(user_id: user_5.id, cocktail_id: cocktail_1.id, vote: 1)

    expect(cocktail_1.cocktail_total_dislikes).to eq(1)
  end
end
