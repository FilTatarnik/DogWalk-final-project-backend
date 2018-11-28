require 'sinatra/base'

# Controller
require './controllers/ApplicationController'
require './controllers/OwnerController'
require './controllers/WalkerController'
require './controllers/AppointmentController'
# Models
require './models/OwnerModel'
require './models/WalkerModel'
require './models/AppointmentModel'
# Root routes
map('/') {
	run ApplicationController
}
map('/api/owner') {
	run OwnerController
}
map('/api/walker') {
	run WalkerController
}
map('/api/appointment') {
	run AppointmentController
}
