require_relative '../lib/assets/ApiConstraints.rb'

Rails.application.routes.draw do
  use_doorkeeper do
    skip_controllers :applications, :authorized_applications
  end

  devise_for :users, controllers: {
               registrations: 'users/registrations',
             }, skip: [:sessions, :password], defaults: { format: :json }

  resources :recs, :comments, :suggestions, :ratings

  ##comment for heroku
end
