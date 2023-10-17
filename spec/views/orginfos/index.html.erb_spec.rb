require 'rails_helper'

RSpec.describe("orginfos/index", type: :view) do
  before(:each) do
    assign(:orginfos, [
      Orginfo.create!(
        title: "Title",
        description: "MyText"
      ),
      Orginfo.create!(
        title: "Title",
        description: "MyText"
      )
    ])
  end

  it "renders a list of orginfos" do
    render
    cell_selector = Rails::VERSION::STRING >= '7' ? 'div>p' : 'tr>td'
    assert_select cell_selector, text: Regexp.new("Title".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("MyText".to_s), count: 2
  end
end
