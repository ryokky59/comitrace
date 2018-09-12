Rails.application.routes.draw do
  get 'users/show'

  get '/schedules/top', to: 'schedules#top'
  root 'schedules#top'
  devise_for :users
  resources :users, :only => [:show]
  resources :schedules
  mount LetterOpenerWeb::Engine, at: "/letter_opener"
end
