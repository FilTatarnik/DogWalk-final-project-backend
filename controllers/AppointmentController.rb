class AppointmentController < ApplicationController
	#index for appointments per walker
	get '/' do
		walker = Walker.find_by email: session[:email]
		{
			status: 200,
			appointments: walker.appointments.order(:id)
		}.to_json
	end
	#create appointment
	post '/' do
		payload_body = request.body.read
		payload = JSON.parse(payload_body).symbolize_keys
		# binding.pry
		pp "hitting route"

		walker = Walker.find_by email: session[:email]
		# use walker to set walker_id instead of using payload to make sure whoever is logged in can submit a appointment

		appointment = Appointment.new
		appointment.dog_id = payload[:dog_id]
		appointment.date = payload[:date]
		# appointment.walker_id = payload[:walker_id]
		# binding.pry
		appointment.walker_id = walker.id
		appointment.save
		{
			status: 200,
			message: "Appointment Created!",
			appointment: appointment
		}.to_json
	end

end