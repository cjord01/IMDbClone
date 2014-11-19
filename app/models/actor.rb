class Actor < ActiveRecord::Base
	has_many :roles
	has_many :movies, through: :roles

	has_attached_file :image, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/missing_image/moviestar.jpg"
	validates :name, presence: true
	validates :name, uniqueness: true
end
