require 'rails_helper'

RSpec.describe RecipeFood, type: :model do
  let(:recipe) { create(:recipe) }
  let(:food) { create(:food) }
  let(:recipe_foods) { create(:recipe_foods, recipe:, food:) }

  describe 'associations' do
    it { is_expected.to belong_to(:recipe) }
    it { is_expected.to belong_to(:food) }
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of(:quantity) }
    it { is_expected.to validate_presence_of(:recipe) }
    it { is_expected.to validate_presence_of(:food) }
  end
end
