require 'rails_helper'

RSpec.describe "feedbacks/new", type: :view do
  before(:each) do
    assign(:feedback, Feedback.new(
      satisfaction: 1,
      critiques: "MyString",
      new_ideas: "MyString",
      member: nil
    ))
  end

  it "renders new feedback form" do
    render

    assert_select "form[action=?][method=?]", feedbacks_path, "post" do

      assert_select "input[name=?]", "feedback[satisfaction]"

      assert_select "input[name=?]", "feedback[critiques]"

      assert_select "input[name=?]", "feedback[new_ideas]"

      assert_select "input[name=?]", "feedback[member_id]"
    end
  end
end
