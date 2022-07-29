require 'rails_helper'

RSpec.describe Recipe, type: :model do
  subject do
    user = User.create(name: 'John', email: 'john@example.com', password: 'password')
    Recipe.new(name: 'Recipe 1', preparation_time: 1, cooking_time: 1, description: 'Recipe 1', public: true,
               user:)
  end

  before { subject.save }

  it 'name should be present' do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it 'preparation_time should be present' do
    subject.preparation_time = 0
    expect(subject).to be_valid
  end

  it 'cooking_time should be present' do
    subject.cooking_time = 0
    expect(subject).to be_valid
  end

  it 'description should be present' do
    subject.description = 'something'
    expect(subject).to be_valid
  end

  it 'user should be present' do
    subject.user = nil
    expect(subject).to_not be_valid
  end

  it 'public should be present' do
    subject.public = false
    expect(subject).to be_valid
  end

  it 'public should be true or false' do
    subject.public = true
    expect(subject).to be_valid
  end

  it 'preparation_time should be equal to or greater than 1' do
    subject.preparation_time = 1
    expect(subject).to be_valid
  end

  it 'cooking_time should be equal to or greater than 1' do
    subject.cooking_time = 1
    expect(subject).to be_valid
  end
end
