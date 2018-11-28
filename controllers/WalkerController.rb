class WalkerController < Sinatra::Base
#-----------------REGISTER------------------#
		post '/register' do
			#recieve JSON requests
			payload_body = request.body.read
			payload = JSON.parse(payload_body).symbolize_keys

			walker_exists = Walker.find_by email: payload[:email]

			if walker_exists
				{
					status: 421,
					message: "username taken"
				}.to_json
			else
				walker = Walker.new
				walker.email = payload[:email]
				walker.password_digest = payload[:password_digest]
				
				walker.save
				session[:logged_in] = true
				session[:email] = walker.email
				{
					status: 200,
					message: "Successfully registered walker #{walker.email}"
				}.to_json
			end
		end
#-----------------LOGIN------------------#
		post '/login' do
			payload_body = request.body.read
			payload = JSON.parse(payload_body).symbolize_keys

			walker = Walker.find_by email: payload[:email]
			pw = payload[:password_digest]
			if walker and walker.authenticate pw
				session[:logged_in] = true
				session[:email] = walker.email
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
			email = session[:email]
			session.destroy
			{
				status: 200,
				message: "Logged out walker #{email}"
			}.to_json
		end
end