class OwnerController < ApplicationController

	before do
		puts ""
		puts "here's the session right now in the filter"
		pp session
	end
#-----------------REGISTER------------------#
# set variable userType for sessions
		post '/register' do
			#recieve JSON requests
			payload_body = request.body.read
			payload = JSON.parse(payload_body).symbolize_keys
			email = payload[:email]
			owner_exists = Owner.find_by email: payload[:email]
			if owner_exists
				{
					status: 421,
					message: "username taken"
				}.to_json
			else
				owner = Owner.new
				owner.email = payload[:email]
				owner.password = payload[:password]
				
				owner.save
				session[:logged_in] = true
				session[:email] = owner.email
				{
					status: 200,
					message: "Successfully registered owner #{owner.email}"
				}.to_json
			end
		end
#-----------------LOGIN------------------#
# set variable userType for sessions
		post '/login' do
			payload_body = request.body.read
			payload = JSON.parse(payload_body).symbolize_keys
			owner = Owner.find_by email: payload[:email]
			pw = payload[:password]
			if owner and owner.authenticate(pw)
				session[:logged_in] = true
				session[:email] = owner.email
		
				puts ""
				puts "here's the session right now after we logged in"
				pp session

				{
					status: 200,
					message: "Successfully logged in"
				}.to_json
			else
				{
					status: 403,
					message: "Invalid email or password"
				}.to_json
			end
		end
#-----------------LOGOUT------------------#
		get '/logout' do
			# binding.pry
			email = session[:email]
			session.destroy
			{
				status: 200,
				message: "Logged out owner"
			}.to_json
		end
end