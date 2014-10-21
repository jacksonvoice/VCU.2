class Question < ActiveRecord::Base
	belongs_to :quizes
	has_many :answers, dependent: :destroy
	accepts_nested_attributes_for :answers
end
