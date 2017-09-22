# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'ffaker'

Post.destroy_all
User.destroy_all
City.destroy_all

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

    City.create([
        {
          name: "San Francisco",
          photo: "https://booksandbark.files.wordpress.com/2016/06/enviousfluffygarpike.gif?w=692",
      },
      {
        name: "London",
        photo: "https://cdn.londonandpartners.com/visit/general-london/areas/westminster-st-james/60262-640x360-parliament-bridge-640.jpg"
        },
        {
          name: "Gibraltar",
          photo: "http://www.visitcapitalcity.com/imagens/city/gibraltar/Gibraltar.jpg"
          }])

Post.create([
    {
      title: FFaker::Tweet.tweet,
      content: FFaker::Lorem.paragraph,
      user: User.first,
      city: City.first
    },
    {
      title: FFaker::Tweet.tweet,
      content: FFaker::Lorem.paragraph,
      user: User.first,
      city: City.first
    },
    {
      title: FFaker::Tweet.tweet,
      content: FFaker::Lorem.paragraph,
      user: User.second,
      city: City.first
    },
    {
      title: FFaker::Tweet.tweet,
      content: FFaker::Lorem.paragraph,
      user: User.third,
      city: City.first
    },
    {
      title: FFaker::Tweet.tweet,
      content: FFaker::Lorem.paragraph,
      user: User.last,
      city: City.first
    },
    {
      title: FFaker::Tweet.tweet,
      content: FFaker::Lorem.paragraph,
      user: User.last,
      city: City.first
    },
    {
      title: FFaker::Tweet.tweet,
      content: FFaker::Lorem.paragraph,
      user: User.last,
      city: City.first
    }
])
