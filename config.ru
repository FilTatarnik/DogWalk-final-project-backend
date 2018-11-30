require 'sinatra/base'

# Controller
require './controllers/ApplicationController'
require './controllers/WalkerController'
require './controllers/OwnerController'
require './controllers/AppointmentController'
require './controllers/DogController'
# Models
require './models/DogModel'
require './models/WalkerModel'
require './models/OwnerModel'
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
map('/api/dog') {
	run DogController
}
map('/api/appointment') {
	run AppointmentController
}
