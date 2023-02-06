require 'rails_helper'

RSpec.describe '/foods', type: :request do

  describe 'GET /index' do
    before(:example) { get foods_path }

    it 'renders a successful response' do
      expect(response).to be_successful
    end
  end

  describe 'GET /show' do
    it 'renders a successful response' do
      @user = User.create(name: "John Smith", email: "john.smith1@gmail.com", password: "password", password_confirmation: "password", confirmed_at: Time.now)
      food = Food.create!(user: @user, name: "Chicken Breasts", measurement_unit: "ounce", price: 100.00, quantity: 3)
      get food_url(food)
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
      @user = User.create(name: "John Smith", email: "john.smith2@gmail.com", password: "password", password_confirmation: "password", confirmed_at: Time.now)
      food = Food.create!(user: @user, name: "Chicken Breasts", measurement_unit: "ounce", price: 100.00, quantity: 3)
      get edit_food_url(food)
      expect(response).to be_successful
    end
  end
end
