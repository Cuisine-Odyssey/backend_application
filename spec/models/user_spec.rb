require 'rails_helper'
RSpec.describe User, type: :model do
  describe 'relationships' do
    it { should have_many(:user_recipes) }
    it { should have_many(:recipes).through(:user_recipes) }
    it { should have_many(:user_cocktails) }
    it { should have_many(:cocktails).through(:user_cocktails) }
  end

  describe 'validations' do
    it { should validate_presence_of(:first_name) }
    it { should validate_presence_of(:last_name) }
    it { should validate_uniqueness_of(:email) }
    it { should have_secure_password }
  end
end
