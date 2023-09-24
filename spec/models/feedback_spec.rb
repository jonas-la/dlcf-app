# spec/models/feedback_spec.rb

require 'rails_helper'

RSpec.describe Feedback, type: :model do
  # Ensure that the Feedback model is valid with valid attributes
  it "is valid with valid attributes" do
    member = Member.create(name: "John Doe") # Assuming you have a Member model
    feedback = Feedback.new(
      satisfaction: 5,
      critiques: "Constructive feedback here",
      new_ideas: "Some new ideas here",
      member: member
    )
    expect(feedback).to be_valid
  end

  # Ensure that the satisfaction attribute is numeric
  it "requires satisfaction to be numeric" do
    feedback = Feedback.new(satisfaction: "not_a_number")
    expect(feedback).not_to be_valid
  end

  # Ensure that the critiques attribute is not empty
  it "requires critiques to be present" do
    feedback = Feedback.new(critiques: "")
    expect(feedback).not_to be_valid
  end

  # Ensure that the new_ideas attribute is not empty
  it "requires new_ideas to be present" do
    feedback = Feedback.new(new_ideas: "")
    expect(feedback).not_to be_valid
  end

  # Ensure that a Feedback must belong to a Member
  it "requires a member" do
    feedback = Feedback.new(
      satisfaction: 5,
      critiques: "Constructive feedback here",
      new_ideas: "Some new ideas here"
    )
    expect(feedback).not_to be_valid
  end
end
