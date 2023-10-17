require 'rails_helper'

RSpec.describe("events/show", type: :view) do
  before(:each) do
    assign(:event, Event.create!(
      event_name: "Event Name",
      location: "Location",
      description: "Description",
      start_time: DateTime.now,
      password: "test123",
      end_time: DateTime.now
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to(match(/Event Name/))
    expect(rendered).to(match(/Location/))
    expect(rendered).to(match(/Description/))
    
  end
end
