require 'rails_helper'

RSpec.describe "attendances/show", type: :view do
  before(:each) do
    assign(:attendance, Attendance.create!(
      member: Member.create!(
        first_name: "MyString",
        preferred_name: "MyString",
        last_name: "MyString",
        email: "MyString@gmail.com",
        is_member: false,
        is_admin: false,
        bio: "MyText",
        contact: "MyString",
        photo_file_name: "MyString",
        role: "MyString"
      ),
      event: Event.create!(
        event_name: "MyString",
        location: "MyString",
        description: "MyString", 
        start_time: DateTime.now,
        password: "test123",
        end_time: DateTime.now
      ),
      # attended: true
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(//)
  end
end
