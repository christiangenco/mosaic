Rails.application.routes.draw do
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
    resources :submissions
  end
  root to: "challenges#index"
end
