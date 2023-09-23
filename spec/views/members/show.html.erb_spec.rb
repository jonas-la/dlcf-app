require 'rails_helper'

RSpec.describe "members/show", type: :view do
  before(:each) do
    assign(:member, Member.create!(
      first_name: "First Name",
      preferred_name: "Preferred Name",
      last_name: "Last Name",
      email: "Email",
      is_member: false,
      is_admin: false,
      bio: "MyText",
      contact: "Contact",
      photo_file_name: "Photo File Name",
      role: "Role"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/First Name/)
    expect(rendered).to match(/Preferred Name/)
    expect(rendered).to match(/Last Name/)
    expect(rendered).to match(/Email/)
    expect(rendered).to match(/false/)
    expect(rendered).to match(/false/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/Contact/)
    expect(rendered).to match(/Photo File Name/)
    expect(rendered).to match(/Role/)
  end
end