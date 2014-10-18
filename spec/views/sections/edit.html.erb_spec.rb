require 'rails_helper'

RSpec.describe "sections/edit", :type => :view do
  before(:each) do
    @section = assign(:section, Section.create!(
      :name => "MyString",
      :course_id => "MyString",
      :integer => "MyString"
    ))
  end

  it "renders the edit section form" do
    render

    assert_select "form[action=?][method=?]", section_path(@section), "post" do

      assert_select "input#section_name[name=?]", "section[name]"

      assert_select "input#section_course_id[name=?]", "section[course_id]"

      assert_select "input#section_integer[name=?]", "section[integer]"
    end
  end
end
