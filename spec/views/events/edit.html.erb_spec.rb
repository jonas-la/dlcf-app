require 'rails_helper'

RSpec.describe "events/edit", type: :view do
  let(:event) {
    Event.create!(
      event_name: "MyString",
      location: "MyString",
      description: "MyString", 
      start_time: DateTime.now,
      password: "test123",
      end_time: DateTime.now
    )
  }

  before(:each) do
    assign(:event, event)
  end

  it "renders the edit event form" do
    render

    assert_select "form[action=?][method=?]", event_path(event), "post" do

      assert_select "input[name=?]", "event[event_name]"

      assert_select "input[name=?]", "event[location]"

      assert_select "input[name=?]", "event[description]"

      assert_select "input[name=?]", "event[start_time]"

      assert_select "input[name=?]", "event[end_time]"

    end
  end
end
