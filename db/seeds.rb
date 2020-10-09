# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

airlines = Airline.create([

  {
  name: "United Airlines",
  image_url: "https://open-flights.s3.amazonaws.com/United-Airlines.png"
  },
  {
  name: "Delta Airlines",
  image_url: "https://open-flights.s3.amazonaws.com/Delta.png"
  },
  {
  name: "Alaska Airlines",
  image_url: "https://open-flights.s3.amazonaws.com/Alaska-Airlines.png"
  }
])

reviews = Review.create([
  {
  title: "Great airline",
  description: "Lovely time onboard",
  score: 5,
  airline: airlines.first
  },
  {
  title: "Bad airline",
  description: "Awful service onboard",
  score: 1,
  airline: airlines.first
  }
])