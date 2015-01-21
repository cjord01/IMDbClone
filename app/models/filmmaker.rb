class Filmmaker < ActiveRecord::Base
	has_many :crew_member
	has_many :movies, through: :crew_member

	has_attached_file :image, :styles => { :medium => "300x300>", :thumb => "100x100>" }
	validates :name, presence: true
	validates :name, uniqueness: true
end
