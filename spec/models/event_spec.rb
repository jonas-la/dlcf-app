require 'rails_helper'

RSpec.describe Event, type: :model do
  it "is valid with valid attributes" do
    event = Event.new(
      event_name: "Sample Event",
      location: "Sample Location",
      start_time: Time.now,
      end_time: Time.now + 1.hour,
      description: "A sample event description."
    )
    expect(event).to be_valid
  end

  # it "is not valid without an event name" do
  #   event = Event.new(
  #     location: "Sample Location",
  #     start_time: Time.now,
  #     end_time: Time.now + 1.hour,
  #     description: "A sample event description."
  #   )
  #   expect(event).to_not be_valid
  # end

  # it "is not valid without a start time" do
  #   event = Event.new(
  #     event_name: "Sample Event",
  #     location: "Sample Location",
  #     end_time: Time.now + 1.hour,
  #     description: "A sample event description."
  #   )
  #   expect(event).to_not be_valid
  # end

  # it "is not valid without an end time" do
  #   event = Event.new(
  #     event_name: "Sample Event",
  #     location: "Sample Location",
  #     start_time: Time.now,
  #     description: "A sample event description."
  #   )
  #   expect(event).to_not be_valid
  # end

  # it "is not valid with a start time later than the end time" do
  #   event = Event.new(
  #     event_name: "Sample Event",
  #     location: "Sample Location",
  #     start_time: Time.now + 2.hours,
  #     end_time: Time.now + 1.hour,
  #     description: "A sample event description."
  #   )
  #   expect(event).to_not be_valid
  # end

  it "is valid with a description of maximum length" do
    event = Event.new(
      event_name: "Sample Event",
      location: "Sample Location",
      start_time: Time.now,
      end_time: Time.now + 1.hour,
      description: "A" * 1000  # Assuming a maximum length of 1000 characters
    )
    expect(event).to be_valid
  end

  # You can add more tests based on your specific validation rules and requirements

end
