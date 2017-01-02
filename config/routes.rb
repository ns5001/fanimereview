Rails.application.routes.draw do
  get '/ratings/highest', to: "ratings#highestRated"
  get '/animes/reccomended', to: "animes#reccomended"
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :animes
  root :to =>'welcome#index'


end
