require 'rails_helper'

RSpec.describe Container, type: :model do

  describe 'Validations' do
    let(:user) { create(:user) }

    it 'should not be valid without a name' do
      container = Container.new(name: nil, user: user)
      expect(container).to_not be_valid
    end

    it 'should be valid' do
      container = Container.new(name: 'Test', user: nil)
      expect(container).to be_valid
    end

    it 'should be valid' do
      container = Container.new(name: 'Test', user: user)
      expect(container).to be_valid
    end
  end

  describe 'Items' do
    let(:user) do
      u = create(:user)
      User.find(u.id)
    end
    let(:container) do
      c = Container.create(name: 'Test', user: user)
      Container.find(c.id)
    end
    let(:child_container) do
      c = Container.create(name: 'Child')
      Container.find(c.id)
    end
    let(:recipe) do
      r = Recipe.create()
      Recipe.find(r.id)
    end

    it 'adds a container' do
      expect(container.add_item(child_container)).to be true
      expect(container.containers).to include(child_container)
      expect(container.recipes).to_not include(child_container)
    end

    it 'adds a recipe' do
      expect(container.add_item(recipe)).to be true
      expect(container.recipes).to include(recipe)
      expect(container.containers).to_not include(recipe)
      expect(user.recipes).to include(recipe)
    end

    it 'will not create a circular relationship' do
      expect(container.add_item(container)).to be false
      expect(container.containers).to_not include(container)
    end

  end

end
