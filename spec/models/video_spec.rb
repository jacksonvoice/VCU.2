require 'rails_helper'

RSpec.describe Video, :type => :model do
  
  it { should belong_to(:section) }

  it "should have a valid factory" do
  	expect(build(:section)).to be_valid
  end
  it "should be valid with a name and Section_id" do
  	video = Video.new(name: 'video', section_id: 1)
  	expect(video).to be_valid
  end
  it "should be invalid with no name" do
  	video = Video.new(name: nil, section_id: 1)
  	expect(video).to be_invalid
  end
  it "should be invalid with no section_id" do
  	video = Video.new(name: 'name', section_id: nil)
  	expect(video).to be_invalid
	end
end
