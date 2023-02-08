require 'rails_helper'

RSpec.describe RecipesController, type: :request do
  before(:each) do
    default_url_options[:host] = 'localhost:3000'
    @user = User.create(name: 'John Smith', email: 'john.smith1@gmail.com', password: 'password',
                        password_confirmation: 'password', confirmed_at: Time.now)
    sign_in @user
  end
  describe 'GET /recipes' do
    it 'returns a success response' do
      get recipes_path
      expect(response).to be_successful
    end
  end
end
