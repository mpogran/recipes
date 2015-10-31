require 'rails_helper'

RSpec.describe "containers/index", type: :view do
  before(:each) do
    assign(:containers, [
      Container.create!(),
      Container.create!()
    ])
  end

  it "renders a list of containers" do
    render
  end
end
