class CrewMember < ActiveRecord::Base
	belongs_to :movie
	belongs_to :filmmaker
  belongs_to :job
end
