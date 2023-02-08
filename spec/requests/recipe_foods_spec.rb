require 'rails_helper'

RSpec.describe '/recipe_foods', type: :request do
  describe 'GET /index' do
    it 'renders a successful response' do
      get recipe_recipe_foods_url(1)
      expect(response).to be_successful
    end
  end
end
