class AppointmentController < ApplicationController
	#index for appointments per walker
	get '/' do
		walker = Walker.find_by email: session[:email]
		response = walker.appointments.map do |appt| 
			{
				id: appt.id,
				dog: appt.dog,
				owner: appt.dog.owner,
				date: appt.date
			}
		end
		{
			status: 200,
			appointments: response# that new variable walker.appointments
		}.to_json
	end
#-----------------CREATE------------------#
	post '/' do
		payload_body = request.body.read
		payload = JSON.parse(payload_body).symbolize_keys
		# binding.pry
		pp "hitting route"
		pp payload

		walker = Walker.find_by email: session[:email]
		# use walker to set walker_id instead of using payload to make sure whoever is logged in can submit a appointment
		appointment = Appointment.new
		appointment.dog_id = payload[:dog_id]
		appointment.date = payload[:date]

		# appointment.walker_id = payload[:walker_id]
		# binding.pry
		appointment.walker_id = payload[:walker_id]
		appointment.save
		{
			status: 200,
			message: "Appointment Created!",
			appointment: appointment
		}.to_json
	end
#-----------------UPDATE------------------#
	put '/:id' do
		payload_body = request.body.read
		payload = JSON.parse(payload_body).symbolize_keys

		appointment = Appointment.find params[:id]
		appointment.date = payload[:date]
		appointment.save
		{
			status: 200,
			message: "Updated Appointment",
			appointment: appointment
		}.to_json
	end
#-----------------DELETE------------------#
	delete '/:id' do
		appointment = Appointment.find params[:id]
		appointment.destroy
		{
			status: 200,
			message: "Canceled Appointment"
		}.to_json
	end

end