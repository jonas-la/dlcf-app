require 'rails_helper'

# RSpec.describe("attendances/ne2w", type: :view) do
#   before(:each) do
#     @event = Event.create!(
#       event_name: "MyString",
#       location: "MyString",
#       description: "MyString", 
#       start_time: DateTime.now,
#       password: "test123",
#       end_time: DateTime.now
#     )
#     assign(:attendance, Attendance.create!(
#         member: Member.create!(
#           first_name: "MyString",
#           preferred_name: "MyString",
#           last_name: "MyString",
#           email: "MyString@gmail.com",
#           is_member: false,
#           is_admin: false,
#           bio: "MyText",
#           contact: "MyString",
#           photo_file_name: "MyString",
#           role: "MyString"
#         ),
#         event: Event.create!(
#           event_name: "MyString",
#           location: "MyString",
#           description: "MyString", 
#           start_time: DateTime.now,
#           password: "test123",
#           end_time: DateTime.now
#         ),
#         attended: true
#       )
#   )
# end

#   it "renders new attendance form" do
# render

# assert_select "form[action=?][method=?]", ne2w_attendances_path, "post" do

#   assert_select "input[name=?]", "attendance[member_id]"

#   assert_select "input[name=?]", "attendance[event_id]"

#   assert_select "input[name=?]", "attendance[attended]"
# end
#   end
# end
