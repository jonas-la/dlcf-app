require 'rails_helper'

RSpec.describe("pending_members/edit", type: :view) do
  let(:pending_member) do
    PendingMember.create!(
      first_name: "MyString",
      preferred_name: "MyString",
      last_name: "MyString",
      email: "MyString@email.com"
    )
  end

  before(:each) do
    assign(:pending_member, pending_member)
  end

  it "renders the edit pending_member form" do
    render

    assert_select "form[action=?][method=?]", pending_member_path(pending_member), "post" do
      assert_select "input[name=?]", "pending_member[first_name]"

      assert_select "input[name=?]", "pending_member[preferred_name]"

      assert_select "input[name=?]", "pending_member[last_name]"

      assert_select "input[name=?]", "pending_member[email]"
    end
  end
end
