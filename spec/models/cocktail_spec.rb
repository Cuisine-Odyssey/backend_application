require 'rails_helper'
RSpec.describe Cocktail, type: :model do
  describe 'relationships' do
    it { should have_many(:user_cocktails) }
    it { should have_many(:users).through(:user_cocktails)}
  end

  
end
