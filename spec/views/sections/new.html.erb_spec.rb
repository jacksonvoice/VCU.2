require 'rails_helper'

RSpec.describe "sections/new", :type => :view do
  before(:each) do
    assign(:section, Section.new(
      :name => "MyString",
      :course_id => "MyString",
      :integer => "MyString"
    ))
  end

  it "renders new section form" do
    render

    assert_select "form[action=?][method=?]", sections_path, "post" do

      assert_select "input#section_name[name=?]", "section[name]"

      assert_select "input#section_course_id[name=?]", "section[course_id]"

      assert_select "input#section_integer[name=?]", "section[integer]"
    end
  end
end
