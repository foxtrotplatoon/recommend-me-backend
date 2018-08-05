Rails.application.routes.draw do
  use_doorkeeper do
    skip_controllers :applications, :authorized_applications
  end

  devise_for :users, controllers: {
               registrations: 'users/registrations',
             }, skip: [:sessions, :password], defaults: { format: :json }

  namespace :api do
    get 'users/sync', to: 'users#sync'
    get 'users/sync_all', to: 'users#sync_all'
    get 'reccs/sync_comments', to: 'reccs#sync_comments'
    resources :reccs, :ratings, :comments, :suggestions, only: [:show, :create, :destroy, :update]
  end

end
