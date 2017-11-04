require 'rails_helper'

RSpec.describe "tools/show", type: :view do
  before(:each) do
    @tool = assign(:tool, Tool.create!(
      :name => "Name",
      :description => "MyText",
      :cost_of_hire_cents => 2,
      :owner => nil,
      :image => "MyText"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/2/)
    expect(rendered).to match(//)
    expect(rendered).to match(/MyText/)
  end
end
