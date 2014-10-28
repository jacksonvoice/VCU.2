class Video < ActiveRecord::Base
	belongs_to :section

	validates :name, :section_id, presence: :true
end
