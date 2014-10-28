require 'rails_helper'

RSpec.describe "videos/new", :type => :view do
  before(:each) do
    assign(:video, Video.new(
      :name => "MyString",
      :section_id => 1
    ))
  end

  it "renders new video form" do
    render

    assert_select "form[action=?][method=?]", videos_path, "post" do

      assert_select "input#video_name[name=?]", "video[name]"

      assert_select "input#video_section_id[name=?]", "video[section_id]"
    end
  end
end
