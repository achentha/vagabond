Rails.application.routes.draw do
  # Might be more intuitive to name this "home#index"
  # and create a home controller and views/home/index.html.erb file
  # (This route isn't really an index page for users)
  root to: "users#index"

  get "/users/new", to: "users#new", as: "new_user"
  post "/users", to: "users#create"
  get "/users/:username", to: "users#show", as: "user"
  get "/users/:username/edit", to: "users#edit", as: "edit_user"
  patch "/users/:username", to: "users#update"

  # Highly recommend nesting routes using resources:
  # resources :cities do
  #   resources :posts do
  #     resources :comments
  #   end
  # end

  # This would create routes like the following:
  # /cities/:city_id
  # /cities/:city_id/posts
  # /cities/:city_id/posts/:post_id
  # /cities/:city_id/posts/:post_id/comments
  # /cities/:city_id/posts/:post_id/comments/:comment_id

  # This is recommended ^, because 
  # 1) It's intuitive (cities have posts, posts have comments) 
  # 2) You have all necessary params for requests in your URL (when you are, say, creating a new post, you have the city_id in the URL)
  # 3) It's short / easy to write
  # 4) It's widely considered best practice (mainly for the above reasons)

  get "/posts/:id", to: "posts#show", as: "post"
  get "/posts/:id/edit", to: "posts#edit", as: "edit_post"
  patch "/posts/:id", to: "posts#update"
  delete "posts/:id", to: "posts#destroy"

  get "posts/:id/comments/new", to: "comments#new", as: "new_comment"
  post "posts/:id/comments", to: "comments#create"
  get "posts/:id/comments/:comment_id/edit", to: "comments#edit", as: "edit_comment"
  patch "posts/:id/comments/:comment_id", to: "comments#update", as: "update_comment"
  delete "posts/:id/comments/:comment_id", to: "comments#destroy"

  get "/login", to: "sessions#new"
  get "/logout", to: "sessions#destroy"
  post "/sessions", to: "sessions#create"

  get "cities/:cityname", to: "cities#show", as: "city"
  get "cities/:cityname/posts/new", to: "posts#new", as: "new_post"
  post "cities/:cityname/posts", to: "posts#create", as: "create_post"
end
