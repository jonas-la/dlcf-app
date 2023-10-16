require 'rails_helper'

RSpec.describe "attendances/index", type: :view do
  before(:each) do
    assign(:attendances, [
      Attendance.create!(
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
        attended: true
      ),
      Attendance.create!(
        member: Member.create!(
          first_name: "MyString",
          preferred_name: "MyString",
          last_name: "MyString",
          email: "MyString2@gmail.com",
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
        attended: true
      )
    ])
  end

  # Not using attendance index anymore, so this doesn't work (should probably remove/comment out the index file)
  # it "renders a list of attendances" do
  #   render
  #   cell_selector = Rails::VERSION::STRING >= '7' ? 'div>p' : 'tr>td'
  #   assert_select cell_selector, text: Regexp.new(nil.to_s), count: 6
  #   assert_select cell_selector, text: Regexp.new(nil.to_s), count: 6
  # end
end
