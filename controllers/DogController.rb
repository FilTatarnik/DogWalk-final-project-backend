class DogController < ApplicationController
	#index for appointments per walker
	get '/' do
		owner = Owner.find_by email: session[:email]
		{
			status: 200,
			dogs: owner.dogs.order(:id)
		}.to_json
	end
#-----------------CREATE------------------#
	post '/' do

		payload_body = request.body.read
		payload = JSON.parse(payload_body).symbolize_keys
		owner = Owner.find_by email: session[:email]
		# binding.pry
		pp "hitting route"
		dog = Dog.new
		dog.name = payload[:name]
		dog.breed = payload[:breed]
		dog.age = payload[:age]
		dog.personality = payload[:personality]
		dog.owner_id = owner.id
		# binding.pry
		dog.save
		{
			status: 200,
			message: "Dog Added!",
			dog: dog
		}.to_json
	end
#-----------------UPDATE------------------#
	put '/:id' do
		payload_body = request.body.read
		payload = JSON.parse(payload_body).symbolize_keys

		dog = Dog.find params[:id]
		dog.name = payload[:name]
		dog.breed = payload[:breed]
		dog.age = payload[:age]
		dog.personality = payload[:personality]
		dog.owner_id = payload[:owner_id]
		dog.save
		{
			status: 200,
			message: "Updated Dog",
			dog: dog
		}.to_json
	end
#-----------------DELETE------------------#
	delete '/:id' do
		dog = Dog.find params[:id]
		dog.destroy
		{
			status: 200,
			message: "Gave away Dog"
		}.to_json
	end
end