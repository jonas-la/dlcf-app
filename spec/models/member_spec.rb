require 'rails_helper'

RSpec.describe(Member, type: :model) do
  it "is valid with valid attributes" do
    member = Member.new(
      first_name: "John",
      last_name: "Doe",
      email: "john@gmail.com",
      is_member: true,
      is_admin: false,
      bio: "A bio for John Doe.",
      contact: "123-456-7890",
      role: "Admin"
    )
    expect(member).to(be_valid)
  end

  it "is not valid without a first name" do
    member = Member.new(
      last_name: "Doe",
      email: "john@gmail.com"
      # Add other required attributes as needed
    )
    expect(member).to_not(be_valid)
  end

  it "is not valid without a last name" do
    member = Member.new(
      first_name: "John",
      email: "john@example.com"
      # Add other required attributes as needed
    )
    expect(member).to_not(be_valid)
  end

  it "is not valid without a valid email address" do
    member = Member.new(
      first_name: "John",
      last_name: "Doe",
      email: "invalid_email" # This should be an invalid email format
      # Add other required attributes as needed
    )
    expect(member).to_not(be_valid)
  end

  # Add more validation tests for other attributes as needed


  # Not doing this at the moment
  # it "should have a default role of 'Admin'" do
  #   member = Member.new(
  #     first_name: "John",
  #     last_name: "Doe"
  #   )
  #   expect(member.role).to eq("Admin")
  # end

  # Add tests for associations if you have any (e.g., has_many, belongs_to)

end
