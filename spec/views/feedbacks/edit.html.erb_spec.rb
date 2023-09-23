require 'rails_helper'

RSpec.describe "feedbacks/edit", type: :view do
  let(:feedback) {
    Feedback.create!(
      satisfaction: 1,
      critiques: "MyString",
      new_ideas: "MyString",
      member: nil
    )
  }

  before(:each) do
    assign(:feedback, feedback)
  end

  it "renders the edit feedback form" do
    render

    assert_select "form[action=?][method=?]", feedback_path(feedback), "post" do

      assert_select "input[name=?]", "feedback[satisfaction]"

      assert_select "input[name=?]", "feedback[critiques]"

      assert_select "input[name=?]", "feedback[new_ideas]"

      assert_select "input[name=?]", "feedback[member_id]"
    end
  end
end
