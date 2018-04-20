# Fuber API a Cab booking API

# Modelling Problem:
- You are the proprietor of füber, an on call taxi service.
- You have a fleet of cabs at your disposal, and each cab has a location, determined by it’s latitude and longitude.
- A customer can call one of your taxis by providing their location, and you must assign the nearest taxi to the customer.
- Some customers are particular that they only ride around in pink cars, for hipster reasons. You must support this ability.
- When the cab is assigned to the customer, it can no longer pick up any other customers
- If there are no taxis available, you reject the customer's request.
- The customer ends the ride at some location. The cab waits around outside the customer’s house, and is available to be assigned to another customer.

# Prerequisites
The setups steps expect following tools installed on the system.
Github
Ruby 2.5
Rails 5.1

### Steps
1. Check out the repository and make it your working directory
```sh
$ https://github.com/anandjose-arackal/Fuber-API.git
$ cd fuber/
```
2. Create database.yml file
*Copy the sample database.yml file and edit the database configuration as required.*
```sh
$ cp config/database.yml.sample config/database.yml
```
3. Create and setup the database
Run the following commands to create and setup the database.
```sh
$ bundle exec rake db:create
$ bundle exec rake db:setup
```
4. Start the Rails server
* ...


# API Description

 Creates a new +Ride+ object, and update status of  +CabStatus+.
   Assign nearest cab  to +Ride+.
  
     API: POST /rides/{pink, source_latitude, source_longitude, dest_latitude, _dest_longitude}
  
   @return [cab_number] The created +Ride+
   
   
  Update a new +Ride+ object, and update status of  +CabStatus+.
   Change Availabilty of cab +CabStatus+.
  
     API: PUT /rides/:id  { dest_latitude, _dest_longitude, cab_id}
 
   @return [ride_cost] updated +Ride+


 Returns all +Cabs+ availbel to Ride
  
    API: GET /cabs
  
   @return [Array] An array of {Cab, Cab}
