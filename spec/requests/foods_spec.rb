require 'rails_helper'

RSpec.describe '/foods', type: :request do
  before do
    @user = User.create(name: 'John Smith', email: 'john.smith1@gmail.com', password: 'password',
                        password_confirmation: 'password', confirmed_at: Time.now)
    sign_in @user
  end

  describe 'GET #index' do
    it 'returns a success response' do
      get foods_path
      expect(response).to be_successful
    end
  end

  describe 'GET /new' do
    it 'renders a successful response' do
      get new_food_url
      expect(response).to be_successful
    end
  end

  describe 'GET /edit' do
    it 'renders a successful response' do
      @user = User.create(name: 'John Smith', email: 'john.smith2@gmail.com', password: 'password',
                          password_confirmation: 'password', confirmed_at: Time.now)
      food = Food.create!(user: @user, name: 'Chicken Breasts', measurement_unit: 'ounce', price: 100.00, quantity: 3)
      get edit_food_url(food)
      expect(response).to be_successful
    end
  end
end
