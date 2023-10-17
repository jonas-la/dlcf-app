require 'rails_helper'

RSpec.describe("pending_members/show", type: :view) do
  before(:each) do
    assign(:pending_member, PendingMember.create!(
                              first_name: "First Name",
                              preferred_name: "Preferred Name",
                              last_name: "Last Name",
                              email: "Email"
                            )
    )
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to(match(/First Name/))
    expect(rendered).to(match(/Preferred Name/))
    expect(rendered).to(match(/Last Name/))
    expect(rendered).to(match(/Email/))
  end
end
