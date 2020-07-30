# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'

# On commence par effacer toute trace de BDD :
# --------------------------------------------
City.destroy_all
Dog.destroy_all
Dogsitter.destroy_all
Stroll.destroy_all


# ça se passe dans 15 villes pour commencer
# -----------------------------------------
15.times {City.create(city_name: Faker::Address.city)}

# On a dejà 70 chiens, avec des prénoms, c'est plus 'cute'
# --------------------------------------------------------
70.times {Dog.create(dog_name: Faker::Name.first_name, city: City.all.sample)}

# Seulement 25 dogsitters pour l'instant...
# -----------------------------------------
25.times {Dogsitter.create(name: Faker::Name.first_name, city: City.all.sample)}


# 120 Strolls
# -----------
120.times {Stroll.create(dog: Dog.all.sample, dogsitter: Dogsitter.all.sample)}
# 120.times do 
#   stroll = Stroll.new
#   stroll.dog = Dog.all.sample
#   stroll.dogsitter = Dogsitter.all.sample
#   stroll.save
# end

