# spec/models/member_spec.rb
require 'rails_helper'

RSpec.describe Member, type: :model do
  # Test validations
  it { should validate_presence_of(:first_name) }
  it { should validate_presence_of(:last_name) }
  it { should validate_presence_of(:email) }
  it { should validate_uniqueness_of(:email).case_insensitive }
  it { should validate_presence_of(:bio) }
  it { should validate_presence_of(:contact) }
  it { should validate_presence_of(:role) }
  
  # Test associations if you have any
  # Example: it { should belong_to(:team) }
  
  # Test boolean fields
  it { should define_enum_for(:is_member).with_values([true, false]) }
  it { should define_enum_for(:is_admin).with_values([true, false]) }
  
  # Test any custom methods or behaviors
  # Example: it "custom_method_name" do
  #   member = create(:member)
  #   expect(member.custom_method_name).to eq(...)
  # end

  # Test any other specific model logic
  
end
