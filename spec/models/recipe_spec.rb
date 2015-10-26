require 'rails_helper'

RSpec.describe Recipe, type: :model do
  let(:user) { create(:user) }

  it 'should create a new recipe' do
    r = Recipe.create(name: 'Test', user: user)
    expect(r).to be_valid
  end
end
