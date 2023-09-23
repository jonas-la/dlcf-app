require 'rails_helper'

RSpec.describe "orginfos/new", type: :view do
  before(:each) do
    assign(:orginfo, Orginfo.new(
      title: "MyString",
      description: "MyText"
    ))
  end

  it "renders new orginfo form" do
    render

    assert_select "form[action=?][method=?]", orginfos_path, "post" do

      assert_select "input[name=?]", "orginfo[title]"

      assert_select "textarea[name=?]", "orginfo[description]"
    end
  end
end
