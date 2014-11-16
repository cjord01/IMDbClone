class Role < ActiveRecord::Base
	belongs_to :movie
	belongs_to :actor

	has_attached_file :image, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/missing_image/moviestar.jpg"
end
