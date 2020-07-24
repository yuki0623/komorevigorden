Rails.application.routes.draw do
  get 'groups/index'
  get 'messages/index'
  root "messages#index"

  
  devise_for :host, controllers: {
    sessions: 'host/sessions',
    passwords: 'host/passwords',
    registrations: 'host/registrations'
  }

  devise_for :casts, controllers: {
    sessions: 'casts/sessions',
    passwords: 'casts/passwords',
    registrations: 'casts/registrations'
  }

  devise_for :gests, controllers: {
    sessions: 'gests/sessions',
    passwords: 'gests/passwords',
    registrations: 'gests/registrations'
  }


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
