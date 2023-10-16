require 'rails_helper'

RSpec.describe "pending_members/index", type: :view do
  before(:each) do
    assign(:pending_members, [
      PendingMember.create!(
        first_name: "First Name",
        preferred_name: "Preferred Name",
        last_name: "Last Name",
        email: "Email"
      ),
      PendingMember.create!(
        first_name: "First Name",
        preferred_name: "Preferred Name",
        last_name: "Last Name",
        email: "Email"
      )
    ])
  end

  it "renders a list of pending_members" do
    render
    cell_selector = Rails::VERSION::STRING >= '7' ? 'div>p' : 'tr>td'
    assert_select cell_selector, text: Regexp.new("First Name".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("Preferred Name".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("Last Name".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("Email".to_s), count: 2
  end
end
