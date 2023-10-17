require 'rails_helper'

RSpec.describe("events/new", type: :view) do
  before(:each) do
    assign(:event, Event.new(
      event_name: "MyString",
      location: "MyString",
      password: "test123",
      description: "MyString"
    ))
  end

  it "renders new event form" do
    render

    assert_select "form[action=?][method=?]", events_path, "post" do

      assert_select "input[name=?]", "event[event_name]"

      assert_select "input[name=?]", "event[location]"

      assert_select "input[name=?]", "event[description]"
    end
  end
end
