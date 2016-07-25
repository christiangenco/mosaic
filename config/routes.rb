Rails.application.routes.draw do
  resources :comments
  devise_for :users, controllers: {
    # confirmations: 'users/confirmations',
    # omniauth_callbacks: 'users/omniauth_callbacks',
    passwords: 'user/passwords',
    registrations: 'user/registrations',
    sessions: 'user/sessions',
    # unlocks: 'users/unlocks',
  }
  # devise_for :users

  resources :challenges do
    resources :submissions do
      member do
        post :like
      end
    end
  end

  resources :users

  get '/submissions', to: "submissions#index"
  root to: "challenges#index"
end
