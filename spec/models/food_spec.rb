require 'rails_helper'

RSpec.describe Food, type: :model do
  @user = User.create(name: 'John Smith', email: 'john.smith@gmail.com', password: 'password',
                      password_confirmation: 'password', confirmed_at: Time.now)

  subject do
    Food.new(user: @user, name: 'Chicken Breasts', measurement_unit: 'ounce', price: 100.00, quantity: 3)
  end

  before { subject.save }

  describe 'validations' do
    it 'should have name present' do
      subject.name = nil
      expect(subject).to_not be_valid
    end

    it 'should have price present' do
      subject.price = nil
      expect(subject).to_not be_valid
    end

    it 'should have quantity present' do
      subject.quantity = nil
      expect(subject).to_not be_valid
    end

    it 'should have quantity greater than or equal to 0' do
      subject.quantity = -1
      expect(subject).to_not be_valid
    end

    it 'should have quantity as an integer' do
      subject.quantity = '23'
      expect(subject).to_not be_valid
    end
  end
end
