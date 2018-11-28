class Walker < ActiveRecord::Base
	has_secure_password
	has_many :appointments
	has_many :dogs, :through => :appointments 
end