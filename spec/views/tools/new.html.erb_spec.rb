require 'rails_helper'

RSpec.describe "tools/new", type: :view do
  before(:each) do
    assign(:tool, Tool.new(
      :name => "MyString",
      :description => "MyText",
      :cost_of_hire_cents => 1,
      :owner => nil,
      :image => "MyText"
    ))
  end

  it "renders new tool form" do
    render

    assert_select "form[action=?][method=?]", tools_path, "post" do

      assert_select "input[name=?]", "tool[name]"

      assert_select "textarea[name=?]", "tool[description]"

      assert_select "input[name=?]", "tool[cost_of_hire_cents]"

      assert_select "input[name=?]", "tool[owner_id]"

      assert_select "textarea[name=?]", "tool[image]"
    end
  end
end
