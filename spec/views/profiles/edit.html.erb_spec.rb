require 'rails_helper'

RSpec.describe "profiles/edit", type: :view do
  before(:each) do
    @profile = assign(:profile, Profile.create!(
      :user => nil,
      :username => "MyString",
      :family_name => "MyString",
      :middle_names => "MyString",
      :first_name => "MyString",
      :country => "MyString",
      :state => "MyString",
      :postcode => 1,
      :suburb => "MyString",
      :street_address => "MyString",
      :level => 1,
      :unit => "MyString",
      :longitude => "9.99",
      :latitude => "9.99",
      :ph_num => "MyString",
      :mob_num => "MyString"
    ))
  end

  it "renders the edit profile form" do
    render

    assert_select "form[action=?][method=?]", profile_path(@profile), "post" do

      assert_select "input[name=?]", "profile[user_id]"

      assert_select "input[name=?]", "profile[username]"

      assert_select "input[name=?]", "profile[family_name]"

      assert_select "input[name=?]", "profile[middle_names]"

      assert_select "input[name=?]", "profile[first_name]"

      assert_select "input[name=?]", "profile[country]"

      assert_select "input[name=?]", "profile[state]"

      assert_select "input[name=?]", "profile[postcode]"

      assert_select "input[name=?]", "profile[suburb]"

      assert_select "input[name=?]", "profile[street_address]"

      assert_select "input[name=?]", "profile[level]"

      assert_select "input[name=?]", "profile[unit]"

      assert_select "input[name=?]", "profile[longitude]"

      assert_select "input[name=?]", "profile[latitude]"

      assert_select "input[name=?]", "profile[ph_num]"

      assert_select "input[name=?]", "profile[mob_num]"
    end
  end
end
