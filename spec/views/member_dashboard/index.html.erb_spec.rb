require 'rails_helper'

RSpec.describe "member_dashboard/index.html.erb", type: :view do
  it "displays member dashboard" do
    render
    expect(rendered).to have_content("About us")
  end
end
