# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

EiUser.create(email: "estebantheboss@mail.com", password: "esteban123", role: 1)
EiUser.create(email: "averagejoe@mail.com", password: "normalpassword", role: 0)

10.times do
    EiJob.create(
      position: Faker::Job.title,
      job_description: Faker::Lorem.paragraph,
      salary: Faker::Number.between(from: 300000, to: 1000000),
      deadline: Faker::Date.forward(days: 30),
      ei_user_id: 1 
    )
  end