require 'rails_helper'

RSpec.describe "feedbacks/show", type: :view do
  before(:each) do
    assign(:feedback, Feedback.create!(
      satisfaction: 2,
      critiques: "Critiques",
      new_ideas: "New Ideas",
      member: nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/2/)
    expect(rendered).to match(/Critiques/)
    expect(rendered).to match(/New Ideas/)
    expect(rendered).to match(//)
  end
end
