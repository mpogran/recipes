require 'rails_helper'

RSpec.describe "containers/edit", type: :view do
  before(:each) do
    @container = assign(:container, Container.create!())
  end

  it "renders the edit container form" do
    render

    assert_select "form[action=?][method=?]", container_path(@container), "post" do
    end
  end
end
