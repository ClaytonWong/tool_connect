require 'rails_helper'

RSpec.describe "profiles/show", type: :view do
  before(:each) do
    @profile = assign(:profile, Profile.create!(
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
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(/Username/)
    expect(rendered).to match(/Family Name/)
    expect(rendered).to match(/Middle Names/)
    expect(rendered).to match(/First Name/)
    expect(rendered).to match(/Country/)
    expect(rendered).to match(/State/)
    expect(rendered).to match(/2/)
    expect(rendered).to match(/Suburb/)
    expect(rendered).to match(/Street Address/)
    expect(rendered).to match(/3/)
    expect(rendered).to match(/Unit/)
    expect(rendered).to match(/9.99/)
    expect(rendered).to match(/9.99/)
    expect(rendered).to match(/Ph Num/)
    expect(rendered).to match(/Mob Num/)
  end
end
