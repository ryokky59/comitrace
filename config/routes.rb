Rails.application.routes.draw do
  devise_for :users
  root 'schedules#index'
  mount LetterOpenerWeb::Engine, at: "/letter_opener"
end
