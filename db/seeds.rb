# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# CREATE MOVIES:
	movie1 = Movie.create(title: "Fight Club")
	movie2 = Movie.create(title: "The Italian Job")
	movie3 = Movie.create(title: "The Fighter")
	movie4 = Movie.create(title: "American Hustle")
	movie5 = Movie.create(title: "The Place Beyond the Pines")
	movie6 = Movie.create(title: "The Ides of March")
	movie7 = Movie.create(title: "Ocean's Eleven")
	movie8 = Movie.create(title: "True Grit")
	movie9 = Movie.create(title: "Gangster Squad")
	movie10 = Movie.create(title: "The Tree of Life")

# CREATE ACTORS:

	actor1 = Actor.create(name: "Brad Pitt")
	actor2 = Actor.create(name: "Edward Norton")
	actor3 = Actor.create(name: "Mark Wahlberg")
	actor4 = Actor.create(name: "Christian Bale")
	actor5 = Actor.create(name: "Bradley Cooper")
	actor6 = Actor.create(name: "Ryan Gosling")
	actor7 = Actor.create(name: "George Clooney")
	actor8 = Actor.create(name: "Matt Damon")
	actor9 = Actor.create(name: "Josh Brolin")
	actor10 = Actor.create(name: "Sean Penn")

# CREATE ROLES:

	Role.create(actor_id: actor2.id, movie_id: movie1.id)
	Role.create(actor_id: actor1.id, movie_id: movie1.id)
	Role.create(actor_id: actor3.id, movie_id: movie2.id)
	Role.create(actor_id: actor2.id, movie_id: movie2.id)
	Role.create(actor_id: actor3.id, movie_id: movie3.id)
	Role.create(actor_id: actor4.id, movie_id: movie3.id)
	Role.create(actor_id: actor4.id, movie_id: movie4.id)
	Role.create(actor_id: actor5.id, movie_id: movie4.id)
	Role.create(actor_id: actor6.id, movie_id: movie5.id)
	Role.create(actor_id: actor5.id, movie_id: movie5.id)
	Role.create(actor_id: actor6.id, movie_id: movie6.id)
	Role.create(actor_id: actor7.id, movie_id: movie6.id)
	Role.create(actor_id: actor7.id, movie_id: movie7.id)
	Role.create(actor_id: actor1.id, movie_id: movie7.id)
	Role.create(actor_id: actor8.id, movie_id: movie7.id)
	Role.create(actor_id: actor8.id, movie_id: movie8.id)
	Role.create(actor_id: actor9.id, movie_id: movie8.id)
	Role.create(actor_id: actor10.id, movie_id: movie9.id)
	Role.create(actor_id: actor9.id, movie_id: movie9.id)
	Role.create(actor_id: actor6.id, movie_id: movie9.id)
	Role.create(actor_id: actor1.id, movie_id: movie10.id)
	Role.create(actor_id: actor10.id, movie_id: movie10.id)