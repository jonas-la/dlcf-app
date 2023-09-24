require 'rails_helper'

RSpec.describe "attendances/show", type: :view do
  before(:each) do
    assign(:attendance, Attendance.create!(
      member: nil,
      event: nil,
      attended: false
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(//)
    expect(rendered).to match(/false/)
  end
end
