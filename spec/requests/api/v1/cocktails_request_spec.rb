require 'rails_helper'

RSpec.describe 'cocktails api' do

  it 'creates a cocktail when a cocktail is not found in the db' do
    user_1 = User.create!(first_name: 'Chuck', last_name: 'Norris', email: 'chuck_5@gmail.com')

    headers = { 'CONTENT_TYPE' => 'application/json' }
      params = {
        "cocktail_api_id"=>"52885",
         "email"=>"chuck_5@gmail.com",
         "vote"=>"like",
         "controller"=>"api/v1/cocktails",
         "action"=>"create",
         "cocktail"=>{
           "cocktail_api_id"=>"52885"
           }
         }

    post "/api/v1/cocktails/like", headers: headers, params: JSON.generate(params)
    cocktail_json = JSON.parse(response.body, symbolize_names: true)

    expect(response).to be_successful
    expect(response.status).to eq(200)
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

  it 'finds a cocktail that already exists' do
    user_1 = User.create!(first_name: 'Chuck', last_name: 'Norris', email: 'chuck_6@gmail.com')
    user_2 = User.create!(first_name: 'Samuel', last_name: 'Jackson', email: 'SammyBoy_6@gmail.com')
    user_3 = User.create!(first_name: 'Will', last_name: 'Ferrel', email: 'the_real_chad_smith_6@gmail.com')
    user_4 = User.create!(first_name: 'Will', last_name: 'Ferrel', email: 'the_real_chad_smith_6000@gmail.com')
    cocktail_1 = Cocktail.create!(cocktail_api_id: 65)
    user_cocktail_1 = UserCocktail.create!(user_id: user_1.id, cocktail_id: cocktail_1.id, vote: 2)
    user_cocktail_5 = UserCocktail.create!(user_id: user_2.id, cocktail_id: cocktail_1.id, vote: 1)
    user_cocktail_6 = UserCocktail.create!(user_id: user_3.id, cocktail_id: cocktail_1.id, vote: 1)
    headers = { 'CONTENT_TYPE' => 'application/json' }
    params = {
      "cocktail_api_id"=>"65",
       "email"=>"the_real_chad_smith_6000@gmail.com",
       "vote"=>"like",
       "controller"=>"api/v1/cocktails",
       "action"=>"create",
       "cocktail"=>{
         "cocktail_api_id"=>"52885"
         }
       }

    post "/api/v1/cocktails/like", headers: headers, params: JSON.generate(params)
    cocktail_json = JSON.parse(response.body, symbolize_names: true)

    expect(response).to be_successful
    expect(response.status).to eq(200)
    expected = cocktail_json[:data][:attributes]
    expect(response).to be_successful
    expect(response.status).to eq(200)
    expect(expected).to have_key(:cocktail_api_id)
    expect(expected[:cocktail_api_id]).to be_a Integer
    expect(expected[:cocktail_api_id]).to eq(cocktail_1.cocktail_api_id)
    expect(expected).to have_key(:sum_likes)
    expect(expected[:sum_likes]).to be_a Integer
    expect(expected[:sum_likes]).to eq(3)
    expect(expected).to have_key(:sum_dislikes)
    expect(expected[:sum_dislikes]).to be_a Integer
    expect(expected[:sum_dislikes]).to eq(1)
  end

  it 'adds to like/dislike hash' do
    user_1 = User.create!(first_name: 'Chuck', last_name: 'Norris', email: 'chuck_7@gmail.com')
    user_2 = User.create!(first_name: 'Samuel', last_name: 'Jackson', email: 'SammyBoy_7@gmail.com')
    user_3 = User.create!(first_name: 'Will', last_name: 'Ferrel', email: 'the_real_chad_smith_7@gmail.com')
    user_4 = User.create!(first_name: 'Will', last_name: 'Ferrel', email: 'the_real_chad_smith_7000@gmail.com')
    cocktail_1000 = Cocktail.create!(cocktail_api_id: 65)
    user_cocktail_1 = UserCocktail.create!(user_id: user_1.id, cocktail_id: cocktail_1000.id, vote: 2)
    user_cocktail_5 = UserCocktail.create!(user_id: user_2.id, cocktail_id: cocktail_1000.id, vote: 2)
    user_cocktail_6 = UserCocktail.create!(user_id: user_3.id, cocktail_id: cocktail_1000.id, vote: 1)
    headers = { 'CONTENT_TYPE' => 'application/json' }
    params = {
      "cocktail_api_id"=>"65",
       "email"=>"the_real_chad_smith_7000@gmail.com",
       "vote"=>"dislike",
       "controller"=>"api/v1/cocktails",
       "action"=>"create",
       "cocktail"=>{
         "cocktail_api_id"=>"52885"
         }
       }

    post "/api/v1/cocktails/dislike", headers: headers, params: JSON.generate(params)
    cocktail_json = JSON.parse(response.body, symbolize_names: true)

    expect(response).to be_successful
    expect(response.status).to eq(200)
    expected = cocktail_json[:data][:attributes]
    expect(response).to be_successful
    expect(response.status).to eq(200)
    expect(expected).to have_key(:cocktail_api_id)
    expect(expected[:cocktail_api_id]).to be_a Integer
    expect(expected[:cocktail_api_id]).to eq(cocktail_1000.cocktail_api_id)
    expect(expected).to have_key(:sum_likes)
    expect(expected[:sum_likes]).to be_a Integer
    expect(expected[:sum_likes]).to eq(1)
    expect(expected[:sum_dislikes]).to be_a Integer
    expect(expected[:sum_dislikes]).to eq(3)
    headers = { 'CONTENT_TYPE' => 'application/json' }
    params = {
      "cocktail_api_id"=>"65",
       "email"=>"the_real_chad_smith_7000@gmail.com",
       "vote"=>"like",
       "controller"=>"api/v1/cocktails",
       "action"=>"create",
       "cocktail"=>{
         "cocktail_api_id"=>"52885"
         }
       }

    post "/api/v1/cocktails/like", headers: headers, params: JSON.generate(params)
    cocktail_json = JSON.parse(response.body, symbolize_names: true)

    expect(response).to be_successful
    expect(response.status).to eq(200)
    expected = cocktail_json[:data][:attributes]
    expect(response).to be_successful
    expect(response.status).to eq(200)
    expect(expected).to have_key(:cocktail_api_id)
    expect(expected[:cocktail_api_id]).to be_a Integer
    expect(expected[:cocktail_api_id]).to eq(cocktail_1000.cocktail_api_id)
    expect(expected).to have_key(:sum_likes)
    expect(expected[:sum_likes]).to be_a Integer
    expect(expected[:sum_likes]).to eq(2)
    expect(expected[:sum_dislikes]).to be_a Integer
    expect(expected[:sum_dislikes]).to eq(2)
  end
end
