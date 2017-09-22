Rails.application.routes.draw do
  root to: "users#index"
  get "/users/new", to: "users#new", as: "new_user"
  post "/users", to: "users#create"
  get "/users/:username", to: "users#show", as: "user"
  get "/users/:username/edit", to: "users#edit", as: "edit_user"
  patch "/users/:username", to: "users#update"

  get "/posts/:id", to: "posts#show", as: "post"
  get "/posts/:id/edit", to: "posts#edit", as: "edit_post"
  patch "/posts/:id", to: "posts#update"
  delete "posts/:id", to: "posts#destroy"

  get "posts/:id/comments/new", to: "comments#new", as: "new_comment"
  post "posts/:id/comments", to: "comments#create"
  get "posts/:id/comments/:comment_id/edit", to: "comments#edit", as: "edit_comment"
  patch "posts/:id/comments/:comment_id", to: "comments#update"
  delete "posts/:id/comments/:comment_id", to: "comments#destroy"

  get "/login", to: "sessions#new"
  get "/logout", to: "sessions#destroy"
  post "/sessions", to: "sessions#create"

  get "cities/:id", to: "cities#show", as: "city"
  get "cities/:id/posts/new", to: "posts#new", as: "new_post"
  post "cities/:id/posts", to: "posts#create"
end
