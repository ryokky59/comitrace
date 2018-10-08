Rails.application.routes.draw do
  root 'schedules#top'
  
  devise_for :users, controllers: {
        registrations: 'users/registrations'
  }

  resources :users, only: [:show] do
    member do
      get :following, :followers, :favorite_stocks, :create_stocks
      patch :schedule_trace
    end
  end

  resources :schedules do
    resources :comments
    collection do
      get :top
      post :confirm
    end
  end

  resources :favorites, only: [:create, :destroy]

  resources :follows, only: [:create, :destroy]

end
