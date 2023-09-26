require 'rails_helper'

RSpec.describe Attendance, type: :model do
    let(:member) { Member.create(
      first_name: 'John',
      preferred_name: 'Johnny',
      last_name: 'Doe',
      email: 'john@example.com',
      is_member: true,
      is_admin: false,
      bio: 'A passionate programmer',
      contact: '123-456-7890',
      photo_file_name: 'john.jpg',
      role: 'Developer'
    )}

    let(:event) { Event.create(
      event_name: 'Tech Conference',
      location: 'Conference Center',
      start_time: DateTime.now,
      end_time: DateTime.now + 2.hours,
      description: 'An exciting tech conference'
    )}

  # Example test cases
  it "is valid with valid attributes" do
    attendance = Attendance.new(member: member, event: event, attended: true)
    expect(attendance).to be_valid
  end

  it "is not valid without a member" do
    attendance = Attendance.new(event: event, attended: true)
    expect(attendance).to_not be_valid
  end

  it "is not valid without an event" do
    attendance = Attendance.new(member: member, attended: true)
    expect(attendance).to_not be_valid
  end

  it "is not valid without an 'attended' status" do
    attendance = Attendance.new(member: member, event: event)
    expect(attendance).to_not be_valid
  end

  it "belongs to a member" do
    association = described_class.reflect_on_association(:member)
    expect(association.macro).to eq(:belongs_to)
  end

  it "belongs to an event" do
    association = described_class.reflect_on_association(:event)
    expect(association.macro).to eq(:belongs_to)
  end
end
