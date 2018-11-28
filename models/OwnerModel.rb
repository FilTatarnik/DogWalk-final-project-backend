class Owner < ApplicationRecord::Base
	has_many :dogs
							# has_many :walkers, :through => :appointments
end