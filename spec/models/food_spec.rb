require 'rails_helper'

RSpec.describe Food, type: :model do
  subject do
    user = User.create(name: 'John', email: 'john@example.com', password: 'password')
    Food.new(name: 'Food 1', measurement_unit: 'KG', price: 20, user: user)
  end

  before { subject.save }

  it 'name should be present' do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it 'measurement_unit should be present' do
    subject.measurement_unit = nil
    expect(subject).to_not be_valid
  end

  it 'user should be present' do
    subject.user = nil
    expect(subject).to_not be_valid
  end

  it 'price should be equal to or greater than 1' do
    subject.price = 1
    expect(subject).to be_valid
  end
end
