class DogController < ApplicationController
	#index for appointments per walker
	get '/' do
		owner = Owner.find_by email: session[:email]
		{
			status: 200,
			dogs: owner.dogs.order(:id)
		}.to_json
	end
	#create appointment
	post '/' do
		payload_body = request.body.read
		payload = JSON.parse(payload_body).symbolize_keys
		# binding.pry
		pp "hitting route"

		# owner = Owner.find_by email: session[:email]

		dog = Dog.new
		dog.name = payload[:name]
		dog.breed = payload[:breed]
		dog.age = payload[:age]
		dog.personality = payload[:personality]
		# binding.pry
		dog.save
		{
			status: 200,
			message: "Dog Added!",
			dog: dog
		}.to_json
	end

end