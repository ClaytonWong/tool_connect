require 'rails_helper'

RSpec.describe "profiles/index", type: :view do
  before(:each) do
    assign(:profiles, [
      Profile.create!(
        :user => nil,
        :username => "Username",
        :family_name => "Family Name",
        :middle_names => "Middle Names",
        :first_name => "First Name",
        :country => "Country",
        :state => "State",
        :postcode => 2,
        :suburb => "Suburb",
        :street_address => "Street Address",
        :level => 3,
        :unit => "Unit",
        :longitude => "9.99",
        :latitude => "9.99",
        :ph_num => "Ph Num",
        :mob_num => "Mob Num"
      ),
      Profile.create!(
        :user => nil,
        :username => "Username",
        :family_name => "Family Name",
        :middle_names => "Middle Names",
        :first_name => "First Name",
        :country => "Country",
        :state => "State",
        :postcode => 2,
        :suburb => "Suburb",
        :street_address => "Street Address",
        :level => 3,
        :unit => "Unit",
        :longitude => "9.99",
        :latitude => "9.99",
        :ph_num => "Ph Num",
        :mob_num => "Mob Num"
      )
    ])
  end

  it "renders a list of profiles" do
    render
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => "Username".to_s, :count => 2
    assert_select "tr>td", :text => "Family Name".to_s, :count => 2
    assert_select "tr>td", :text => "Middle Names".to_s, :count => 2
    assert_select "tr>td", :text => "First Name".to_s, :count => 2
    assert_select "tr>td", :text => "Country".to_s, :count => 2
    assert_select "tr>td", :text => "State".to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => "Suburb".to_s, :count => 2
    assert_select "tr>td", :text => "Street Address".to_s, :count => 2
    assert_select "tr>td", :text => 3.to_s, :count => 2
    assert_select "tr>td", :text => "Unit".to_s, :count => 2
    assert_select "tr>td", :text => "9.99".to_s, :count => 2
    assert_select "tr>td", :text => "9.99".to_s, :count => 2
    assert_select "tr>td", :text => "Ph Num".to_s, :count => 2
    assert_select "tr>td", :text => "Mob Num".to_s, :count => 2
  end
end
