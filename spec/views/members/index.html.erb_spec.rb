require 'rails_helper'

RSpec.describe "members/index", type: :view do
  before(:each) do
    assign(:members, [
      Member.create!(
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
      ),
      Member.create!(
        first_name: "First Name",
        preferred_name: "Preferred Name",
        last_name: "Last Name",
        email: "Email2@gmail.com",
        is_member: false,
        is_admin: false,
        bio: "MyText",
        contact: "Contact",
        photo_file_name: "Photo File Name",
        role: "Role"
      )
    ])
  end

  it "renders a list of members" do
    render
    cell_selector = Rails::VERSION::STRING >= '7' ? 'div>p' : 'tr>td'
    assert_select cell_selector, text: Regexp.new("First Name".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("Preferred Name".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("Last Name".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("Email@gmail.com".to_s), count: 2
    assert_select cell_selector, text: Regexp.new(false.to_s), count: 2
    assert_select cell_selector, text: Regexp.new(false.to_s), count: 2
    assert_select cell_selector, text: Regexp.new("MyText".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("Contact".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("Photo File Name".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("Role".to_s), count: 2
  end
end
