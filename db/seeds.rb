# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'ffaker'

Comment.destroy_all
Post.destroy_all
User.destroy_all
City.destroy_all


User.create([{
    name: "Michelle",
    current_city: "San Francisco",
    password: "ellis",
    avatar: File.new("#{Rails.root}/app/assets/images/original/michelle.jpg")
    },
    {
       name: "Esther",
       current_city: "Los Angeles",
       password: "ellis",
       avatar: File.new("#{Rails.root}/app/assets/images/original/esther.jpg")
    },
    {
       name: "Matt",
       current_city: "San Francisco",
       password: "ellis",
       avatar: File.new("#{Rails.root}/app/assets/images/original/matt.jpg")
    },
    {
       name: "Kim",
       current_city: "BestKorea",
       password: "ellis",
       avatar: File.new("#{Rails.root}/app/assets/images/original/kim.jpg")
    },
    {
       name: "Donald",
       current_city: "Washington",
       password: "ellis",
       avatar: File.new("#{Rails.root}/app/assets/images/original/donald.jpg")
    },
    {
       name: "Chris",
       current_city: "Dallas",
       password: "ellis",
       avatar: File.new("#{Rails.root}/app/assets/images/original/chris.jpg")
    },
    ])

    City.create([
        {
          name: "San Francisco",
          photo: "https://booksandbark.files.wordpress.com/2016/06/enviousfluffygarpike.gif?w=692",
      },
      {
        name: "London",
        photo: "http://data.whicdn.com/images/36451199/original.gif"
        },
        {
          name: "Gibraltar",
          photo: "https://media.tenor.com/images/b1a747ade0d210db743af735482b42f3/tenor.gif"
          }])
posts_arr = []

25.times do
  posts_arr << {
     title: FFaker::Tweet.tweet,
      content: FFaker::Lorem.paragraph,
      user: User.all.sample,
      city: City.first
  }
end

15.times do
  posts_arr << {
     title: FFaker::Tweet.tweet,
      content: FFaker::Lorem.paragraph,
      user: User.all.sample,
      city: City.second
  }
end

7.times do
  posts_arr << {
     title: FFaker::Tweet.tweet,
      content: FFaker::Lorem.paragraph,
      user: User.all.sample,
      city: City.third
  }
end


Post.create(posts_arr)
comments_arr = []

50.times do
  comments_arr << {
    content: FFaker::Lorem.paragraph,
    user: User.all.sample,
    post: Post.all.sample
  }
end
Comment.create(comments_arr)
