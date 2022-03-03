require 'rails_helper'
RSpec.describe 'Recipe API' do
  it 'returns one recipe' do
    user_1 = User.create(first_name: 'Chuck', last_name: 'Norris', email: 'chuck_1@gmail.com')
    user_2 = User.create(first_name: 'Samuel', last_name: 'Jackson', email: 'SammyBoy_1@gmail.com')
    user_3 = User.create(first_name: 'Will', last_name: 'Ferrel', email: 'the_real_chad_smith_1@gmail.com')
    user_4 = User.create(first_name: 'Luke', last_name: 'SkyWalker', email: 'the_force_1@gmail.com')
    user_5 = User.create(first_name: 'Eddie', last_name: 'Murphey', email: 'worst_actor_1@gmail.com')
    recipe_1 = Recipe.create(recipe_api_id: 13)
    user_recipe_1 = UserRecipe.create(user_id: user_1.id, recipe_id: recipe_1.id, vote: 2)
    user_recipe_2 = UserRecipe.create(user_id: user_2.id, recipe_id: recipe_1.id, vote: 1)
    user_recipe_3 = UserRecipe.create(user_id: user_3.id, recipe_id: recipe_1.id, vote: 1)
    user_recipe_4 = UserRecipe.create(user_id: user_4.id, recipe_id: recipe_1.id, vote: 1)
    user_recipe_5 = UserRecipe.create(user_id: user_5.id, recipe_id: recipe_1.id, vote: 1)


    get "/api/v1/recipes/#{recipe_1.id}"


    recipe = JSON.parse(response.body, symbolize_names: true)

    expect(response).to be_successful
    expect(response.status).to eq(200)

    data = recipe[:data][:attributes]
    expect(response).to be_successful
    expect(response.status).to eq(200)

    expect(data).to have_key(:recipe_api_id)
    expect(data[:recipe_api_id]).to be_a Integer

    expect(data).to have_key(:sum_likes)
    expect(data[:sum_likes]).to be_a Integer

    expect(data).to have_key(:sum_dislikes)
    expect(data[:sum_dislikes]).to be_a Integer
  end

  it 'creates a recipe when a recipe is not found in the db' do
    user_1 = User.create!(first_name: 'Chuck', last_name: 'Norris', email: 'chuck_2@gmail.com')

    headers = { 'CONTENT_TYPE' => 'application/json' }
    params = {
      "recipe_api_id"=>"52885",
       "email"=>"chuck_2@gmail.com",
       "vote"=>"like",
       "controller"=>"api/v1/recipes",
       "action"=>"create",
       "recipe"=>{
         "recipe_api_id"=>"52885"
         }
       }

    post "/api/v1/recipes/like", headers: headers, params: JSON.generate(params)
    recipe_json = JSON.parse(response.body, symbolize_names: true)

    expect(response).to be_successful
    expect(response.status).to eq(200)
    expected = recipe_json[:data][:attributes]
    expect(response).to be_successful
    expect(response.status).to eq(200)
    expect(expected).to have_key(:recipe_api_id)
    expect(expected[:recipe_api_id]).to be_a Integer
    expect(expected).to have_key(:sum_likes)
    expect(expected[:sum_likes]).to be_a Integer
    expect(expected).to have_key(:sum_dislikes)
    expect(expected[:sum_dislikes]).to be_a Integer
  end

  it 'finds a recipe that already exists' do
    user_1 = User.create!(first_name: 'Chuck', last_name: 'Norris', email: 'chuck_3@gmail.com')
    user_2 = User.create!(first_name: 'Samuel', last_name: 'Jackson', email: 'SammyBoy_3@gmail.com')
    user_3 = User.create!(first_name: 'Will', last_name: 'Ferrel', email: 'the_real_chad_smith_3@gmail.com')
    recipe_1 = Recipe.create!(recipe_api_id: 65)
    user_recipe_1 = UserRecipe.create!(user_id: user_1.id, recipe_id: recipe_1.id, vote: 2)
    user_recipe_5 = UserRecipe.create!(user_id: user_2.id, recipe_id: recipe_1.id, vote: 1)
    user_recipe_6 = UserRecipe.create!(user_id: user_3.id, recipe_id: recipe_1.id, vote: 1)
    headers = { 'CONTENT_TYPE' => 'application/json' }
    params = {
      "recipe_api_id"=>"65",
       "email"=>"chuck_3@gmail.com",
       "vote"=>"like",
       "controller"=>"api/v1/recipes",
       "action"=>"create",
       "recipe"=>{
         "recipe_api_id"=>"52885"
         }
       }

    post "/api/v1/recipes/like", headers: headers, params: JSON.generate(params)
    recipe_json = JSON.parse(response.body, symbolize_names: true)

    expect(response).to be_successful
    expect(response.status).to eq(200)
    expected = recipe_json[:data][:attributes]
    expect(response).to be_successful
    expect(response.status).to eq(200)
    expect(expected).to have_key(:recipe_api_id)
    expect(expected[:recipe_api_id]).to be_a Integer
    expect(expected[:recipe_api_id]).to eq(recipe_1.recipe_api_id)
    expect(expected).to have_key(:sum_likes)
    expect(expected[:sum_likes]).to be_a Integer
    expect(expected[:sum_likes]).to eq(3) # created new user_recipe record to get 3 likes
    expect(expected).to have_key(:sum_dislikes)
    expect(expected[:sum_dislikes]).to be_a Integer
    expect(expected[:sum_dislikes]).to eq(1)
  end

  it 'adds to like/dislike hash' do
    user_1 = User.create!(first_name: 'Chuck', last_name: 'Norris', email: 'chuck_4@gmail.com')
    user_2 = User.create!(first_name: 'Samuel', last_name: 'Jackson', email: 'SammyBoy_4@gmail.com')
    user_3 = User.create!(first_name: 'Will', last_name: 'Ferrel', email: 'the_real_chad_smith_4@gmail.com')
    recipe_1 = Recipe.create!(recipe_api_id: 65)
    user_recipe_1 = UserRecipe.create!(user_id: user_1.id, recipe_id: recipe_1.id, vote: 2)
    user_recipe_5 = UserRecipe.create!(user_id: user_2.id, recipe_id: recipe_1.id, vote: 2)
    user_recipe_6 = UserRecipe.create!(user_id: user_3.id, recipe_id: recipe_1.id, vote: 1)
    headers = { 'CONTENT_TYPE' => 'application/json' }
    params = {
      "recipe_api_id"=>"65",
       "email"=>"chuck_4@gmail.com",
       "vote"=>"dislike",
       "controller"=>"api/v1/recipes",
       "action"=>"create",
       "recipe"=>{
         "recipe_api_id"=>"52885"
         }
       }

    post "/api/v1/recipes/like", headers: headers, params: JSON.generate(params)
    recipe_json = JSON.parse(response.body, symbolize_names: true)

    expect(response).to be_successful
    expect(response.status).to eq(200)
    expected = recipe_json[:data][:attributes]
    expect(response).to be_successful
    expect(response.status).to eq(200)
    expect(expected).to have_key(:recipe_api_id)
    expect(expected[:recipe_api_id]).to be_a Integer
    expect(expected[:recipe_api_id]).to eq(recipe_1.recipe_api_id)
    expect(expected).to have_key(:sum_likes)
    expect(expected[:sum_likes]).to be_a Integer
    expect(expected[:sum_likes]).to eq(1)
    expect(expected[:sum_dislikes]).to be_a Integer
    expect(expected[:sum_dislikes]).to eq(2)
  end
end
