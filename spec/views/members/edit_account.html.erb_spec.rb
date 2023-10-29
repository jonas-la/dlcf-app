require 'rails_helper'

RSpec.describe("members/edit_account", type: :view) do
  let(:member) {
    Member.create!(
      first_name: "MyString",
      preferred_name: "MyString",
      last_name: "MyString",
      email: "MyString@gmail.com",
      is_member: false,
      is_admin: false,
      bio: "MyText",
      contact: "MyString",
      photo_file_name: "MyString",
      role: "MyString"
    )
  }

  before(:each) do
    assign(:member, member)
  end

  it "renders the edit member form" do
    render

    assert_select "form[action=?][method=?]", edit_account_members_path, "post" do

      assert_select "input[name=?]", "member[first_name]"

      assert_select "input[name=?]", "member[preferred_name]"

      assert_select "input[name=?]", "member[last_name]"

      assert_select "input[name=?]", "member[email]"

      assert_select "input[name=?]", "member[is_member]"

      assert_select "input[name=?]", "member[is_admin]"

      assert_select "textarea[name=?]", "member[bio]"

      assert_select "input[name=?]", "member[contact]"

      assert_select "input[name=?]", "member[photo_file_name]"

      assert_select "input[name=?]", "member[role]"
    end
  end
end
