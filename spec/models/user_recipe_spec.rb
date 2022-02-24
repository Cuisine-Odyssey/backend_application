require 'rails_helper'
RSpec.describe UserRecipe, type: :model do
  describe 'relationships' do
    it { should belong_to(:user) }
    it { should belong_to(:recipe) }
  end
  describe 'validations' do
    it { should validate_presence_of(:user_id) }
    it { should validate_presence_of(:recipe_id) }
  end

  describe 'vote enum' do
    it { should define_enum_for(:vote).with(['no_vote', 'like', 'dislike']) }
  end
end
