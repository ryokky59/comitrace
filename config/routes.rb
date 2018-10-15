Rails.application.routes.draw do
  root 'schedules#top'

  devise_for :users, controllers: {
        registrations: 'users/registrations'
  }

  resources :users, only: [:show], shallow: true do
    resources :create_stocks, only: [:index]
    resources :favorite_stocks, only: [:index]
    resources :followers, only: [:index]
    resources :followings, only: [:index]
    member do
      patch :schedule_trace
    end
  end

  resources :schedules do
    resources :comments, only: [:index, :create]
    collection do
      get :top
      post :confirm
    end
  end

  resources :favorites, only: [:create, :destroy]

  resources :follows, only: [:create, :destroy]

end
