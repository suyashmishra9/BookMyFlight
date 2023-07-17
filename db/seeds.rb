# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
Airline.destroy_all

Airline.create!([
  { name: "IndiGo", code: "6E" } , 
  { name: "Air India", code: "AI" },
  { name: "Emirates", code: "EK" },
  { name: "British Airways", code: "BA" }
])

Flight.destroy_all

# Find the airlines
emirates = Airline.find_by(name: "Emirates")
air_india = Airline.find_by(name: "Air India")
british_airways = Airline.find_by(name: "British Airways")
indigo = Airline.find_by(name: "IndiGo")

# Define different routes for each airline

indigo_routes = [
  { departure_airport: "Bengaluru", arrival_airport: "Delhi" },
  { departure_airport: "Mumbai", arrival_airport: "Kolkata" },
  { departure_airport: "Chennai", arrival_airport: "Hyderabad" },
  { departure_airport: "Goa", arrival_airport: "Ahmedabad" },
  { departure_airport: "Jaipur", arrival_airport: "Lucknow" },
  { departure_airport: "Amritsar", arrival_airport: "Varanasi" },
  { departure_airport: "Kochi", arrival_airport: "Indore" },
  { departure_airport: "Raipur", arrival_airport: "Patna" },
  { departure_airport: "Guwahati", arrival_airport: "Bhopal" },
  { departure_airport: "Nagpur", arrival_airport: "Surat" }
]

air_india_routes = [
  { departure_airport: "Delhi", arrival_airport: "Mumbai" },
  { departure_airport: "Kolkata", arrival_airport: "Chennai" },
  { departure_airport: "Bengaluru", arrival_airport: "Hyderabad" },
  { departure_airport: "Goa", arrival_airport: "Ahmedabad" },
  { departure_airport: "Jaipur", arrival_airport: "Lucknow" },
  { departure_airport: "Amritsar", arrival_airport: "Patna" },
  { departure_airport: "Varanasi", arrival_airport: "Guwahati" },
  { departure_airport: "Kochi", arrival_airport: "Trivandrum" },
  { departure_airport: "Indore", arrival_airport: "Pune" },
  { departure_airport: "Raipur", arrival_airport: "Bhopal" }
]

emirates_routes = [
  { departure_airport: "Dubai", arrival_airport: "London" },
  { departure_airport: "Paris", arrival_airport: "New York" },
  { departure_airport: "Singapore", arrival_airport: "Sydney" },
  { departure_airport: "Tokyo", arrival_airport: "Toronto" },
  { departure_airport: "Mumbai", arrival_airport: "Hong Kong" },
  { departure_airport: "Cape Town", arrival_airport: "Amsterdam" },
  { departure_airport: "Dublin", arrival_airport: "Berlin" },
  { departure_airport: "Rome", arrival_airport: "Barcelona" },
  { departure_airport: "Vienna", arrival_airport: "Prague" },
  { departure_airport: "Zurich", arrival_airport: "Athens" }
]

british_airways_routes = [
  { departure_airport: "London", arrival_airport: "Paris" },
  { departure_airport: "Rome", arrival_airport: "Berlin" },
  { departure_airport: "Barcelona", arrival_airport: "Amsterdam" },
  { departure_airport: "Dublin", arrival_airport: "Vienna" },
  { departure_airport: "Prague", arrival_airport: "Zurich" },
  { departure_airport: "Athens", arrival_airport: "Moscow" },
  { departure_airport: "Stockholm", arrival_airport: "Oslo" },
  { departure_airport: "Copenhagen", arrival_airport: "Helsinki" },
  { departure_airport: "Brussels", arrival_airport: "Luxembourg" },
  { departure_airport: "Warsaw", arrival_airport: "Budapest" }
]


# Create flights for each airline with corresponding routes
  
  emirates_flights = emirates_routes.map.with_index do |route|
  emirates.flights.create!(
    flight_no: rand(1_000_000..9_999_999),
    airline_name: emirates.name,
    departure_airport: route[:departure_airport],
    arrival_airport: route[:arrival_airport],
    departure_time: Time.now + rand(1..4).hours,
    arrival_time: Time.now + rand(5..6).hours,
    flight_duration: Time.now + rand(1..2).hours,
    total_price: rand(1000..6000),
    airline_id: emirates.id
  )
end

  air_india_flights = air_india_routes.map.with_index do |route|
  air_india.flights.create!(
    flight_no: rand(1_000_000..9_999_999),
    airline_name: air_india.name,
    departure_airport: route[:departure_airport],
    arrival_airport: route[:arrival_airport],
    departure_time: Time.now + rand(1..4).hours,
    arrival_time: Time.now + rand(5..6).hours,
    flight_duration: Time.now + rand(1..2).hours,
    total_price: rand(1000..6000),
    airline_id: air_india.id
  )
end

  british_airways_flights = british_airways_routes.map.with_index do |route|
  british_airways.flights.create!(
    flight_no: rand(1_000_000..9_999_999),
    airline_name: british_airways.name,
    departure_airport: route[:departure_airport],
    arrival_airport: route[:arrival_airport],
    departure_time: Time.now + rand(1..4).hours,
    arrival_time: Time.now + rand(5..6).hours,
    flight_duration: Time.now + rand(1..2).hours,
    total_price: rand(1000..6000),
    airline_id: british_airways.id
  )
end

  indigo_flights = indigo_routes.map.with_index do |route|
  indigo.flights.create!(
    flight_no: rand(1_000_000..9_999_999),
    airline_name: indigo.name,
    departure_airport: route[:departure_airport],
    arrival_airport: route[:arrival_airport],
    departure_time: Time.now + rand(1..4).hours,
    arrival_time: Time.now + rand(5..6).hours,
    flight_duration: Time.now + rand(1..2).hours,
    total_price: rand(1000..6000),
    airline_id: indigo.id
  )
end
