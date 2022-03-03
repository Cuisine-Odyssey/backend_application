require 'rails_helper'
RSpec.describe 'Users API' do
  it 'returns one user' do
    user_1 = User.create!(first_name: 'Chuck', last_name: 'Norris', email: 'chuck_20@gmail.com')

    headers = { 'CONTENT_TYPE' => 'application/json' }
    params = {"email"=>"chuck_20@gmail.com", "controller"=>"api/v1/users", "action"=>"show"}

    get "/api/v1/users", headers: headers, params: params
    user = JSON.parse(response.body, symbolize_names: true)

    expect(response).to be_successful
    expect(response.status).to eq(200)
    expected = user[:data][:attributes]
    expect(response).to be_successful
    expect(response.status).to eq(200)

    expect(expected).to have_key(:email)
    expect(expected[:email]).to be_a String

    expect(expected).to have_key(:first_name)
    expect(expected[:first_name]).to be_a String

    expect(expected).to have_key(:last_name)
    expect(expected[:last_name]).to be_a String

    expect(expected).to have_key(:recipe_likes)
    expect(expected[:recipe_likes]).to be_a Array

    expect(expected).to have_key(:recipe_dislikes)
    expect(expected[:recipe_dislikes]).to be_a Array

    expect(expected).to have_key(:cocktail_likes)
    expect(expected[:cocktail_likes]).to be_a Array

    expect(expected).to have_key(:cocktail_dislikes)
    expect(expected[:cocktail_dislikes]).to be_a Array
  end

  it 'returns one 404 if invalid params are provided' do
    user_1 = User.create!(first_name: 'Chuck', last_name: 'Norris', email: 'chuck_20@gmail.com')

    headers = { 'CONTENT_TYPE' => 'application/json' }
    params = {"email"=>"chuck_20gmail.com", "controller"=>"api/v1/users", "action"=>"show"}

    get "/api/v1/users", headers: headers, params: params

    expect(response.status).to eq(404)
  end

  it 'creates or finds a user' do
    headers = { 'CONTENT_TYPE' => 'application/json' }
      params = {
                "first_name": "Bob",
                "last_name": "Dole",
                "email": "bobdole@gmail.com"
               }


    post "/api/v1/users/create", headers: headers, params: JSON.generate(user: params)


    expect(response).to be_successful
    expect(response.status).to eq(200)
    user_json = JSON.parse(response.body, symbolize_names: true)

    expected = user_json[:data][:attributes]
    expect(response).to be_successful
    expect(response.status).to eq(200)

    expect(expected).to have_key(:email)
    expect(expected[:email]).to be_a String

    expect(expected).to have_key(:first_name)
    expect(expected[:first_name]).to be_a String

    expect(expected).to have_key(:last_name)
    expect(expected[:last_name]).to be_a String

    expect(expected).to have_key(:recipe_likes)
    expect(expected[:recipe_likes]).to be_a Array

    expect(expected).to have_key(:recipe_dislikes)
    expect(expected[:recipe_dislikes]).to be_a Array

    expect(expected).to have_key(:cocktail_likes)
    expect(expected[:cocktail_likes]).to be_a Array

    expect(expected).to have_key(:cocktail_dislikes)
    expect(expected[:cocktail_dislikes]).to be_a Array
  end

  it 'finds a user that already exists' do
    user = User.create!(first_name: 'Chew', last_name: 'Baca', email: 'wookie_1@gmail.com')
    headers = { 'CONTENT_TYPE' => 'application/json' }
    params = {
              "first_name": "Chew",
              "last_name": "Baca",
              "email": "wookie_1@gmail.com"
             }


    post "/api/v1/users/create", headers: headers, params: JSON.generate(user: params)

    user_json = JSON.parse(response.body, symbolize_names: true)
    expect(response).to be_successful
    expect(response.status).to eq(200)
    expect(user.id).to eq(user_json[:data][:id].to_i)
    expect(user.email).to eq(user_json[:data][:attributes][:email])
    expect(user.first_name).to eq(user_json[:data][:attributes][:first_name])
    expect(user.last_name).to eq(user_json[:data][:attributes][:last_name])
  end
end
