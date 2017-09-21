# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Post.destroy_all
User.destroy_all

User.create([{
    name: "ellis",
    current_city: "San Francisco",
    password: "ellis"
    },
    {
    name: "chen",
    current_city: "Fremont",
    password: "chen",
    },
    {
    name: "david",
    current_city: "New York",
    password: "david"
    }])

Post.create([
    {
      title: "Food",
      content: "Great food in SJ",
      user: User.first
             },
    {
      title: "Job",
      content: "No jobs in SJ",
      user: User.second
    }, {
      title: "Movies",
      content: "Some movies in Dallas",
      user: User.third
    },
            {
      title: "School",
      content: "School is great!",
      user: User.first
    }])