require 'rails_helper'

RSpec.describe "feedbacks/index", type: :view do
  before(:each) do
    assign(:feedbacks, [
      Feedback.create!(
        satisfaction: 2,
        critiques: "Critiques",
        new_ideas: "New Ideas",
        member: Member.create!(
          first_name: "First Name",
          preferred_name: "Preferred Name",
          last_name: "Last Name",
          email: "Email@gmail.com",
          is_member: false,
          is_admin: false,
          bio: "MyText",
          contact: "Contact",
          photo_file_name: "Photo File Name",
          role: "Role"
        ),
      ),
      Feedback.create!(
        satisfaction: 2,
        critiques: "Critiques",
        new_ideas: "New Ideas",
        member: Member.create!(
          first_name: "First Name",
          preferred_name: "Preferred Name",
          last_name: "Last Name",
          email: "Email2@gmail.com",
          is_member: false,
          is_admin: false,
          bio: "MyText",
          contact: "Contact",
          photo_file_name: "Photo File Name",
          role: "Role"
        ),
      )
    ])
  end

  it "renders a list of feedbacks" do
    render
    cell_selector = Rails::VERSION::STRING >= '7' ? 'div>p' : 'tr>td'
    assert_select cell_selector, text: Regexp.new(2.to_s), count: 2
    assert_select cell_selector, text: Regexp.new("Critiques".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("New Ideas".to_s), count: 2
  end
end
