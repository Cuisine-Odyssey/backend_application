require 'rails_helper'
RSpec.describe 'Users API' do
  it 'returns one user' do
    user = create(:user)

    get "/api/v1/users/#{user.id}"

    user = JSON.parse(response.body, symbolize_names: true)

    expect(response).to be_successful
    expect(response.status).to eq(200)
  end
end