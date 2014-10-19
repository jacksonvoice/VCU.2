require 'rails_helper'

RSpec.describe Course, :type => :model do
  
	it { should have_many(:sections) }

	describe Course do

		it "has a valid factory" do
			expect(build(:course)).to be_valid
		end

		it "is valid with a name" do
			course = Course.new(name: 'technique')
			expect(course).to be_valid
		end
	

		it "is invalid without a name" do
			expect(build(:invalid_course)).to be_invalid
		end

	end

end
