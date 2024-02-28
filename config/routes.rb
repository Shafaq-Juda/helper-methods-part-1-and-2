Rails.application.routes.draw do
  root "movies#index"

  # Routes for the Movie resource:

  # CREATE
  post "/movies" => "movies#create", as: :movies  # movies_url and movies_path(in view templates we use movies_path instead of route, and in controller action, when redirecting and so on, we should use movies_url [always]).
  get "/movies/new" => "movies#new", as: :new_movie    # new_movies_url and new_movies_path
          
  # READ
  get "/movies" => "movies#index" 
  get "/movies/:id" => "movies#show", as: :movie #movie_path() excepts an argument to populate :id segment.
  
  # UPDATE
  patch "/movies/:id" => "movies#update"
  get "/movies/:id/edit" => "movies#edit", as: :edit_movie # edit_movie_path() excepts an argument to populate :id segment.
  

  # DELETE
  delete "/movies/:id" => "movies#destroy"

  #------------------------------
end
