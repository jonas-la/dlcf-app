require 'rails_helper'

RSpec.describe "attendances/edit", type: :view do
  let(:attendance) {
    Attendance.create!(
      member: nil,
      event: nil,
      attended: false
    )
  }

  before(:each) do
    assign(:attendance, attendance)
  end

  it "renders the edit attendance form" do
    render

    assert_select "form[action=?][method=?]", attendance_path(attendance), "post" do

      assert_select "input[name=?]", "attendance[member_id]"

      assert_select "input[name=?]", "attendance[event_id]"

      assert_select "input[name=?]", "attendance[attended]"
    end
  end
end
