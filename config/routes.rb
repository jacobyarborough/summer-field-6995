Rails.application.routes.draw do
  get '/', to: 'application#welcome'

  get '/studios', to: 'studios#index'

  get '/movies/:id', to: 'movies#show'

  post '/movies_actors', to: 'movie_actors#create'
end
