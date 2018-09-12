Rails.application.routes.draw do
  get '/schedules/top', to: 'schedules#top'
  root to: 'schedules#top'
  devise_for :users
  resources :schedules
  mount LetterOpenerWeb::Engine, at: "/letter_opener"
end
