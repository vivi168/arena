# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

g1 = Gladiator.create name: "Spartacus"
g2 = Gladiator.create name: "Maximus"
g2 = Gladiator.create name: "Jean Valjean"


w1 = Weapon.create name: "Sword & Shield", damage_low: 6, damage_high: 12, speed: 1
w2 = Weapon.create name: "Great Sword", damage_low: 6, damage_high: 12, speed: 1
w3 = Weapon.create name: "Long Sword", damage_low: 12, damage_high: 18, speed: 3
w4 = Weapon.create name: "Hammer", damage_low: 12, damage_high: 18, speed: 3
