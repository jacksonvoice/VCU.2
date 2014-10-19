class Course < ActiveRecord::Base
	has_many :sections

	accepts_nested_attributes_for :sections

	validates :name, presence: true
end
