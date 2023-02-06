require 'rails_helper'

RSpec.describe "recipes/index", type: :view do
  before(:each) do
    assign(:recipes, [
      Recipe.create!(
        name: "Name",
        preparation_time: "Preparation Time",
        cooking_time: "Cooking Time",
        description: "MyText",
        public: false,
        user: nil
      ),
      Recipe.create!(
        name: "Name",
        preparation_time: "Preparation Time",
        cooking_time: "Cooking Time",
        description: "MyText",
        public: false,
        user: nil
      )
    ])
  end

  it "renders a list of recipes" do
    render
    cell_selector = Rails::VERSION::STRING >= '7' ? 'div>p' : 'tr>td'
    assert_select cell_selector, text: Regexp.new("Name".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("Preparation Time".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("Cooking Time".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("MyText".to_s), count: 2
    assert_select cell_selector, text: Regexp.new(false.to_s), count: 2
    assert_select cell_selector, text: Regexp.new(nil.to_s), count: 2
  end
end
