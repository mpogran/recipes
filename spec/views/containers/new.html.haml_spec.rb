require 'rails_helper'

RSpec.describe "containers/new", type: :view do
  before(:each) do
    assign(:container, Container.new())
  end

  it "renders new container form" do
    render

    assert_select "form[action=?][method=?]", containers_path, "post" do
    end
  end
end
