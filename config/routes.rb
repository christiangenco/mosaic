Rails.application.routes.draw do
  resources :challenges
  root to: "challenges#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
