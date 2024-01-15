Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      mount_devise_token_auth_for 'User', at: 'auth', controllers: {
        registrations: 'api/v1/auth/registrations'
      }
      namespace :auth do
        resources :sessions, only: %i[index, destroy]
      end
      resources :users, only: %i[show]
      resources :posts, only: %i[new create index show]
    end
  end
end
