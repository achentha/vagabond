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
    photo: "http://cs.wellesley.edu/~hcilab/iGEM_wiki/images/Team/Michelle.jpg"
    },
    {
       name: "Esther",
       current_city: "Los Angeles",
       password: "ellis",
       photo: "https://avatars2.githubusercontent.com/u/6993359?v=4&s=460"
    },
    {
       name: "Matt",
       current_city: "San Francisco",
       password: "ellis",
       photo: "https://media.licdn.com/mpr/mpr/shrinknp_400_400/AAEAAQAAAAAAAA0rAAAAJGRjODgxZGRlLWRiYzgtNDlhNi05MGEzLWFhYTJkMmM1Y2U1NQ.jpg"
    },
    {
       name: "Kim Un",
       current_city: "BestKorea",
       password: "ellis",
       photo: "http://i2.cdn.cnn.com/cnnnext/dam/assets/170109100009-north-korea-missile-launch-threat-trump-hancocks-lok-00002012-large-169.jpg"
    },
    {
       name: "Donald",
       current_city: "Washington",
       password: "ellis",
       photo: "https://pro.creditwritedowns.com/wp-content/uploads/2016/12/donald_trump_flag.jpg"
    },
    {
       name: "Chris",
       current_city: "Dallas",
       password: "ellis",
       photo: "http://www.trbimg.com/img-57b793b4/turbine/la-et-ct-chris-hansen-20160819-snap"
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
