Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  post 'api/v1/authenticate', to: 'api/v1/authentication#authenticate'
  post 'api/v1/register', to: 'api/v1/registration#register'

  namespace :api do
    namespace :v1 do
      resources :projects
    end
  end
  
end
