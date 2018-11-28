class Dog < ActiveRecord::Base
	belongs_to :owner
	has_many :walkers, :through :appointments
end