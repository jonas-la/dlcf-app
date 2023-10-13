require 'rails_helper'

RSpec.describe "officer_dashboard/index.html.erb", type: :view do
  it "displays officer dashboard" do
    render
    expect(rendered).to have_content("Edit Profile")
    expect(rendered).to have_content("About us")
    expect(rendered).to have_content("You're Logged into the Officer Dashboard")

  end
end
