require 'rails_helper'

RSpec.describe "sections/show", :type => :view do
  before(:each) do
    @section = assign(:section, Section.create!(
      :name => "Name",
      :course_id => "Course",
      :integer => "Integer"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/Course/)
    expect(rendered).to match(/Integer/)
  end
end
