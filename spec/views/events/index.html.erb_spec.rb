require 'rails_helper'

RSpec.describe "events/index", type: :view do
  before(:each) do
    assign(:events, [
      Event.create!(
        event_name: "Event Name",
        location: "Location",
        description: "Description",
        start_time: DateTime.now,
        password: "test123",
        end_time: DateTime.now
      ),
      Event.create!(
        event_name: "Event Name",
        location: "Location",
        description: "Description",
        start_time: DateTime.now,
        password: "test123",
        end_time: DateTime.now
      )
    ])
  end

  it "renders a list of events" do
    current_admin = Admin.new()
    current_admin.email = "test@email.com"
    render
    cell_selector = Rails::VERSION::STRING >= '7' ? 'div>p' : 'tr>td'
    assert_select cell_selector, text: Regexp.new("Event Name".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("Location".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("Description".to_s), count: 2
  end
end
