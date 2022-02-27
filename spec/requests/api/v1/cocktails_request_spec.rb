require 'rails_helper'

RSpec.describe 'cocktails api' do

  it 'creates a cocktail when a cocktail is not found in the db' do
    headers = { 'CONTENT_TYPE' => 'application/json' }
      params = {
                "cocktail_api_id": 14,
               }

    post "/api/v1/cocktails/create", headers: headers, params: JSON.generate(cocktail: params)

    expect(response).to be_successful
    expect(response.status).to eq(200)
    cocktail_json = JSON.parse(response.body, symbolize_names: true)
    expected = cocktail_json[:data][:attributes]
    expect(response).to be_successful
    expect(response.status).to eq(200)
    expect(expected).to have_key(:cocktail_api_id)
    expect(expected[:cocktail_api_id]).to be_a Integer
    expect(expected).to have_key(:sum_likes)
    expect(expected[:sum_likes]).to be_a Integer
    expect(expected).to have_key(:sum_dislikes)
    expect(expected[:sum_dislikes]).to be_a Integer
  end

  it 'finds a user that already exists' do
    user_1 = User.create!(first_name: 'Chuck', last_name: 'Norris', email: 'chuck@gmail.com')
    user_2 = User.create!(first_name: 'Samuel', last_name: 'Jackson', email: 'SammyBoy@gmail.com')
    user_3 = User.create!(first_name: 'Will', last_name: 'Ferrel', email: 'the_real_chad_smith@gmail.com')
    cocktail_1 = Cocktail.create!(cocktail_api_id: 13)
    user_cocktail_1 = UserCocktail.create!(user_id: user_1.id, cocktail_id: cocktail_1.id, vote: 2)
    user_cocktail_5 = UserCocktail.create!(user_id: user_2.id, cocktail_id: cocktail_1.id, vote: 1)
    user_cocktail_6 = UserCocktail.create!(user_id: user_3.id, cocktail_id: cocktail_1.id, vote: 1)
    headers = { 'CONTENT_TYPE' => 'application/json' }
    params = {
                "cocktail_api_id": 13,
             }

    post "/api/v1/cocktails/create", headers: headers, params: JSON.generate(cocktail: params)

    expect(response).to be_successful
    expect(response.status).to eq(200)
    cocktail_json = JSON.parse(response.body, symbolize_names: true)
    expected = cocktail_json[:data][:attributes]
    expect(response).to be_successful
    expect(response.status).to eq(200)
    expect(expected).to have_key(:cocktail_api_id)
    expect(expected[:cocktail_api_id]).to be_a Integer
    expect(expected[:cocktail_api_id]).to eq(cocktail_1.cocktail_api_id)
    expect(expected).to have_key(:sum_likes)
    expect(expected[:sum_likes]).to be_a Integer
    expect(expected[:sum_likes]).to eq(2)
    expect(expected).to have_key(:sum_dislikes)
    expect(expected[:sum_dislikes]).to be_a Integer
    expect(expected[:sum_dislikes]).to eq(1)
  end
end
