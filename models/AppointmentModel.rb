class Appointment < ActiveRecord::Base
	acts_as_bookable
	belongs_to :dog
	belongs_to :walker
end