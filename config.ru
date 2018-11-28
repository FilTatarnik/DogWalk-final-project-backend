require 'sinatra/base'

# Controller
require './controllers/ApplicationController'
require './controllers/AppointmentController'
require './controllers/OwnerController'
require './controllers/WalkerController'
# Models
require './models/AppointmentModel'
require './models/OwnerModel'
require './models/WalkerModel'
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
