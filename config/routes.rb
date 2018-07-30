Rails.application.routes.draw do
  use_doorkeeper do
    skip_controllers :applications, :authorized_applications
  end

  devise_for :users, controllers: {
               registrations: 'users/registrations',
             }, skip: [:sessions, :password], defaults: { format: :json }

  resources :reccs, :ratings, :comments
end
