require 'rails_helper'
RSpec.describe Recipe, type: :model do
  describe 'relationships' do
    it { should have_many(:user_recipes) }
    it { should have_many(:users).through(:user_recipes) }
  end
end
