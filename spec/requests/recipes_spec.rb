require 'rails_helper'

RSpec.describe RecipesController, type: :request do
  before(:each) do
    default_url_options[:host] = 'localhost:3000'
  end
  describe "GET /recipes" do
    it "returns a success response" do
      get recipes_path
      expect(response).to be_successful
    end
  end
end
