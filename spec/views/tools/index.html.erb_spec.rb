require 'rails_helper'

RSpec.describe "tools/index", type: :view do
  before(:each) do
    assign(:tools, [
      Tool.create!(
        :name => "Name",
        :description => "MyText",
        :cost_of_hire_cents => 2,
        :owner => nil,
        :image => "MyText"
      ),
      Tool.create!(
        :name => "Name",
        :description => "MyText",
        :cost_of_hire_cents => 2,
        :owner => nil,
        :image => "MyText"
      )
    ])
  end

  it "renders a list of tools" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end
end
