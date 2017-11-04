require 'rails_helper'

RSpec.describe "tools/edit", type: :view do
  before(:each) do
    @tool = assign(:tool, Tool.create!(
      :name => "MyString",
      :description => "MyText",
      :cost_of_hire_cents => 1,
      :owner => nil,
      :image => "MyText"
    ))
  end

  it "renders the edit tool form" do
    render

    assert_select "form[action=?][method=?]", tool_path(@tool), "post" do

      assert_select "input[name=?]", "tool[name]"

      assert_select "textarea[name=?]", "tool[description]"

      assert_select "input[name=?]", "tool[cost_of_hire_cents]"

      assert_select "input[name=?]", "tool[owner_id]"

      assert_select "textarea[name=?]", "tool[image]"
    end
  end
end
