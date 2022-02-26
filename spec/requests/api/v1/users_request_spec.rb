require 'rails_helper'
RSpec.describe 'Users API' do
  it 'returns one user' do
    user = create(:user)

    get "/api/v1/users/#{user.id}"

    user = JSON.parse(response.body, symbolize_names: true)

    expect(response).to be_successful
    expect(response.status).to eq(200)
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
  end

  it 'finds a user that already exists' do
    user = User.create!(first_name: 'Chew', last_name: 'Baca', email: 'wookie@gmail.com')
    headers = { 'CONTENT_TYPE' => 'application/json' }
    params = {
              "first_name": "Chew",
              "last_name": "Baca",
              "email": "wookie@gmail.com"
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
