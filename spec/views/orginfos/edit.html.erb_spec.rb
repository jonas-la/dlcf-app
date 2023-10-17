require 'rails_helper'

RSpec.describe("orginfos/edit", type: :view) do
  let(:orginfo) {
    Orginfo.create!(
      title: "MyString",
      description: "MyText"
    )
  }

  before(:each) do
    assign(:orginfo, orginfo)
  end

  it "renders the edit orginfo form" do
    render

    assert_select "form[action=?][method=?]", orginfo_path(orginfo), "post" do

      assert_select "input[name=?]", "orginfo[title]"

      assert_select "textarea[name=?]", "orginfo[description]"
    end
  end
end
