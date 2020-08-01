Rails.application.routes.draw do
  get 'groups/index'
  get 'messages/index'
  root "kartes#toppage"
  # root "messages#index"
  
  devise_for :hosts, controllers: {
    sessions: 'hosts/sessions',
    passwords: 'hosts/passwords',
    registrations: 'hosts/registrations'
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


  resources :hosts, only: [:index, :new, :create, :edit, :update] do
    namespace :api do
      resources :messages, only: :index, defaults: { format: 'json' }
    end
  end


  resources :casts, only: [:index, :new, :create, :edit, :update] do
    namespace :api do
      resources :messages, only: :index, defaults: { format: 'json' }
    end
  end


  resources :gests, only: [:index, :new, :create, :edit, :update] do
    namespace :api do
      resources :messages, only: :index, defaults: { format: 'json' }
    end
  end


  resources :kartes do
    resources :messages, only: [:index, :create]
    collection do
      get 'toppage'
    end
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
