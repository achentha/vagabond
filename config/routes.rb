Rails.application.routes.draw do
  root to: "users#index"
  get "/users/new", to: "users#new", as: "new_user"
  post "/users", to: "users#create"
  get "/users/:id", to: "users#show", as: "user"
  get "/users/:id/edit", to: "users#edit", as: "edit_user"
  patch "/users/:id", to: "users#update"

  get "/posts/:id", to: "posts#show", as: "post"
  get "/posts/:id/edit", to: "posts#edit", as: "edit_post"
  patch "/posts/:id", to: "posts#update"
  delete "posts/:id", to: "posts#destroy"

  get "/login", to: "sessions#new"
  get "/logout", to: "sessions#destroy"
  post "/sessions", to: "sessions#create"

  get "cities/:id", to: "cities#show", as: "city"
  get "cities/:id/posts/new", to: "posts#new", as: "new_post"
  post "cities/:id/posts", to: "posts#create"
end
