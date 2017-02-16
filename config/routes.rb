Rails.application.routes.draw do

  get '/animes/topThree/:id', to: "animes#topThree"
  get '/ratings/highest', to: "ratings#highestRated"
  get '/animes/reccomended', to: "animes#reccomended"

  devise_for :users, :controllers => { :registrations => "registrations" }

  get '/connections/friends', to: "connections#getFriends"

  get '/ratings/myreviews', to: "ratings#userReviews"
  get '/animes/search', to: "animes#searchAnime"

  get '/animereccomendation/reccomended', to: "anime_reccomendations#getReccomended"
  get '/ratingreccomendation/reccomended', to: "rating_reccomendations#getReccomended"
  get '/users/inbox', to: "users#inbox"

  get "/messages/received" => 'messages#getReceivedMessages'
  get "/messages/sent" => 'messages#getSentMessages'
  get "/connections/received" => 'connections#getReceivedRequests'
  get "/connections/sent" => 'connections#getSentRequests'
  get 'messages/:id/message_data', to: 'messages#message_data'
  get "/messages/chain/:id" => 'messages#messageHistory'

  resources :welcomes

  root 'welcomes#index'
  resources :users
  resources :animes
  resources :ratings
  resources :messages
  resources :anime_reccomendations
  resources :rating_reccomendations


  get "/ratings/topthree/:id" => 'ratings#top_three'


end
