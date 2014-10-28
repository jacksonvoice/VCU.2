require 'rails_helper'

RSpec.describe Section, :type => :model do
  
  it { should have_many(:videos) }
  it { should belong_to(:course) }

  	it "has a valid factory" do
  		expect(build(:section)).to be_valid
	end
  it "is valid with a name & course_id" do
  	section = Section.new(name: 'namehere', course_id: 1)
  	expect(section).to be_valid
  end
  it "is invalid with no name" do
  	section = Section.new(name: '', course_id: 1)
  	expect(section).to be_invalid
  end

  it "is invalid with no course_id" do
  	section = Section.new(name: 'name', course_id: nil)
  	expect(section).to be_invalid
  end

end
