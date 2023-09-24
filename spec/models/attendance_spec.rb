require 'rails_helper'

RSpec.describe Attendance, type: :model do
  # Create some test data using FactoryBot
  let(:member) { FactoryBot.create(:member) }
  let(:event) { FactoryBot.create(:event) }

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
