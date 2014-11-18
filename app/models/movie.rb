class Movie < ActiveRecord::Base
	has_many :roles
	has_many :actors, through: :roles

	has_attached_file :image, :styles => { :medium => "300x300>", :thumb => "100x100>" }
	validates :title, presence: { strict: true }
	validates :title, uniqueness: { strict: true }
end
