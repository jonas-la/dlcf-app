require 'rails_helper'

RSpec.describe "pending_members/new", type: :view do
  before(:each) do
    assign(:pending_member, PendingMember.new(
      first_name: "MyString",
      preferred_name: "MyString",
      last_name: "MyString",
      email: "MyString"
    ))
  end

  it "renders new pending_member form" do
    render

    assert_select "form[action=?][method=?]", pending_members_path, "post" do

      assert_select "input[name=?]", "pending_member[first_name]"

      assert_select "input[name=?]", "pending_member[preferred_name]"

      assert_select "input[name=?]", "pending_member[last_name]"

      assert_select "input[name=?]", "pending_member[email]"
    end
  end
end
