Rails.application.routes.draw do

  get '/schedules/top', to: 'schedules#top'
  root 'schedules#top'
  devise_for :users
  resources :users, only: [:show]
  resources :schedules do
    collection do
      post :confirm
    end
  end
  resources :favorites, only: [:create, :destroy]
  mount LetterOpenerWeb::Engine, at: "/letter_opener"
end
