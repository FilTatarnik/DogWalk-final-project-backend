class ApplicationController < Sinatra::Base

	require 'bundler'
	Bundler.require()

	enable :sessions

	ActiveRecord::Base.establish_connection(
			:adapter => 'postgresql',
			:database => 'leash_pals'
		)
	register Sinatra::CrossOrigin

	configure do
		enable :cross_origin
	end

	set :allow_origin, :any
	set :allow_credentials, true
	set :allow_methods, [:get, :post, :put, :patch, :delete, :options]

	# telling the browswer what's okay in the options
	options '*' do
		puts "hitting options request route"
		response.headers['Allow'] = 'HEAD, GET, POST, PUT, PATCH, DELETE, OPTIONS'
		response.header['Access-Control-Allow-Origin'] = 'http://localhost:3000'
	    response.header['Access-Control-Allow-Crudentials'] = 'true'
	    response.headers["Access-Control-Allow-Headers"] = "X-Requested-With, X-HTTP-Method-Override, Authorization, Content-Type, Cache-Control, Accept"  
	    200 #this is the status code & also allows
	end

	#testing to see if ApplicationController '/' route works
	get '/' do {
		status: 200,
		message: "Server works and is connected"
	}.to_json
	end
	
end