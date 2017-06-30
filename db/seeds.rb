# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


Interest.create([{name: "Outdoors"}])
Interest.create([{name: "Partying"}])
Interest.create([{name: "Painting"}])
Interest.create([{name: "Reading"}])
Interest.create([{name: "Travel"}])
Interest.create([{name: "Movies"}])
Interest.create([{name: "Coffee"}])
Interest.create([{name: "Cooking"}])
Interest.create([{name: "Exercise"}])
Interest.create([{name: "Shopping"}])

# User.create([{name:"Peter", password_digest:1, city: "NYC", age:31, sex:"Male", orientation: "Straight", ethnicity:"White", height: 71, physical_shape}])
#
#
# create_table "users", force: :cascade do |t|
#   t.string   "name"
#   t.string   "password_digest"
#   t.string   "city"
#   t.integer  "age"
#   t.string   "sex"
#   t.string   "orientation"
#   t.string   "ethnicity"
#   t.integer  "height"
#   t.string   "physical_shape"
#   t.integer  "children"
#   t.string   "relationship"
#   t.string   "education"
#   t.string   "image"
#   t.text     "bio"
