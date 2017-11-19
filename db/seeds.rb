# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
textbooks = Textbook.create([{title: "Biology", price: 25},
                            {title: "Chemistry", price: 45},
                            {title: "Algebra", price: 100},
                            {title: "Geology", price: 250},
                            {title: "Astronomy", price: 105}])

courses = Course.create([
    {name: 'Bio 1', enrollment: 500},    
    {name: 'Chem 1', enrollment: 400},    
    {name: 'Math 1', enrollment: 300},    
    {name: 'Science 1', enrollment: 200},    
    {name: 'Astro 1', enrollment: 100},    
])