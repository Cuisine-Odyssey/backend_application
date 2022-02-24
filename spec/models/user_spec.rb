require 'rails_helper'
RSpec.describe User, type: :model do
  describe 'relationships' do
    it { should have_many(:user_recipes) }
    it { should have_many(:recipes).through(:user_recipes) }
    it { should have_many(:user_cocktails) }
    it { should have_many(:cocktails).through(:user_cocktails) }
  end
end
