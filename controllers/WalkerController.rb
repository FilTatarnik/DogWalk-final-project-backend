class WalkerController < ApplicationController


	before do
		puts ""
		puts "here's the session right now in the filter"
		pp session
	end

	get '/' do
		walker = Walker.all
		{
			status: 200,
			walker: walker
		}.to_json
	end
#-----------------REGISTER------------------#
		post '/register' do
			#recieve JSON requests
			payload_body = request.body.read
			payload = JSON.parse(payload_body).symbolize_keys
			email = payload[:email]
			walker_exists = Walker.find_by email: payload[:email]

			if walker_exists
				{
					status: 421,
					message: "username taken"
				}.to_json
			else
				walker = Walker.new
				walker.name = payload[:name]
				walker.email = payload[:email]
				walker.password = payload[:password]
				
				walker.save
				session[:logged_in] = true
				session[:email] = walker.email
				{
					status: 200,
					message: "Successfully registered walker #{walker.email}"
				}.to_json
			end
		end
#-----------------UPDATE------------------#
		put '/:id' do
			payload_body = request.body.read
			payload = JSON.parse(payload_body).symbolize_keys

			walker = Walker.find params[:id]
			walker.name = payload[:name]
			walker.email = payload[:email]
			walker.age = payload[:age]
			walker.save
			{
				status: 200,
				message: "Updated Walker",
				walker: walker
			}.to_json
		end
#-----------------LOGIN------------------#
		post '/login' do
			payload_body = request.body.read
			payload = JSON.parse(payload_body).symbolize_keys

			walker = Walker.find_by email: payload[:email]
			pw = payload[:password]

			if walker and walker.authenticate(pw)
				session[:logged_in] = true
				session[:email] = walker.email
		
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
				message: "Logged out walker"
			}.to_json
		end
#-----------------DELETE------------------#
	delete '/:id' do
		walker = Walker.find params[:id]
		walker.destroy
		{
			status: 200,
			message: "Destroyed Walker"
		}.to_json
	end
end