require 'rails_helper'

RSpec.describe 'foods/show', type: :view do
  before(:each) do
    assign(:food, Food.create!(
                    name: 'Name',
                    measurement_unit: 'Measurement Unit',
                    price: '',
                    quantity: 2,
                    user: nil
                  ))
  end

  it 'renders attributes in <p>' do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/Measurement Unit/)
    expect(rendered).to match(//)
    expect(rendered).to match(/2/)
    expect(rendered).to match(//)
  end
end
