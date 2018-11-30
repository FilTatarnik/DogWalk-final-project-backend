class Walker < ActiveRecord::Base
	has_secure_password
	acts_as_booker
	has_many :appointments
	has_many :dogs, :through => :appointments 
end