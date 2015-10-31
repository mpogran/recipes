require 'rails_helper'

RSpec.describe "containers/show", type: :view do
  before(:each) do
    @container = assign(:container, Container.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end
