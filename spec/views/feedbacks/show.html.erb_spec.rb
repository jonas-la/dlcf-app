require 'rails_helper'

RSpec.describe("feedbacks/show", type: :view) do
  before(:each) do
    assign(:feedback, Feedback.create!(
      satisfaction: 2,
      critiques: "Critiques",
      new_ideas: "New Ideas",
      member: Member.create!(
        first_name: "First Name",
        preferred_name: "Preferred Name",
        last_name: "Last Name",
        email: "Email@gmail.com",
        is_member: false,
        is_admin: false,
        bio: "MyText",
        contact: "Contact",
        photo_file_name: "Photo File Name",
        role: "Role"
      )
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to(match(/2/))
    expect(rendered).to(match(/Critiques/))
    expect(rendered).to(match(/New Ideas/))
    expect(rendered).to(match(//))
  end
end
