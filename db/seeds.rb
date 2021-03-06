# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Admin.create(email: 'admin@mailinator.com', password: 'password', password_confirmation: 'password', first_name: 'Admin', last_name: 'User')

Instructor.create(email: 'instructor@mailinator.com',
             password: 'password',
             first_name: 'Instructor',
             last_name: 'User')

Student.create(email: 'student@mailinator.com',
             password: 'password',
             first_name: 'Student',
             last_name: 'User')
