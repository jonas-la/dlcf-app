require 'rails_helper'

RSpec.describe "members/new", type: :view do
  before(:each) do
    assign(:member, Member.new(
      first_name: "MyString",
      preferred_name: "MyString",
      last_name: "MyString",
      email: "MyString",
      is_member: false,
      is_admin: false,
      bio: "MyText",
      contact: "MyString",
      photo_file_name: "MyString",
      role: "MyString"
    ))
  end

  it "renders new member form" do
    render

    assert_select "form[action=?][method=?]", members_path, "post" do

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
