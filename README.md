# Leash Pals Backend
## How to begin
```
git clone https://github.com/FilTatarnik/DogWalk-final-project-backend.git
cd into Directory
Open IDE of choice
copy and paste Migrations.sql file into terminal
Hit enter to run Migrations.sql
Databse and tables will be created
If still in psql shell, hit \q to enter back into normal terminal
bundle install
bundle exec rackup
Run simultaneously with frontend -> https://github.com/FilTatarnik/capstone-front-end
```

## API calls
replace localhost:9292 with https://leash-pals-frontend.herokuapp.com/ for the deployed version

### Get Walkers
## GET
localhost:9292/api/walker
### Walker Register
## POST
localhost9292/api/walker/register
### Walker Login
## POST
localhost9292/api/walker/login
### Walker Logout
## GET
localhost:9292/api/walker/logout
### Owner Register
## POST
localhost:9292/api/owner/register
### Owner Login
localhost:9292/api/owner/login
### Owner Logout
localhost:9292/api/owner/logout
### Create Appointment
localhost:9292/api/appointment/
### Create Dog
localhost:9292/api/dog
### Edit Owner
localhost:9292/api/owner/:id
### Edit Walker
localhost:9292/api/walker/:id
### Edit Dog
localhost:9292/api/dog/:id
### Edit Appointment
localhost:9292/api/appointment/:id
### Delete Dog
localhost:9292/api/dog/:id
### Delete Owner
localhost:9292/api/owner/:id
### Delete Walker
localhost:9292/api/walker/:id
### Delete Appointment
localhost:9292/api/appointment/:id

