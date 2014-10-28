class Section < ActiveRecord::Base
	belongs_to :course
	has_many :videos

	validates :name, :course_id, presence: true
end
