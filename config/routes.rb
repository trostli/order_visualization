Rails.application.routes.draw do
  resources :hubs, :only => [:index]
  resources :orders, :only => [:index], defaults: { format: 'json' }

  # get '/orders', to: redirect('/hubs')

  get 'order/import', to: 'orders#upload'
  post 'order/import', to: 'orders#import'

  get 'hub/import', to: 'hubs#upload'
  post 'hub/import', to: 'hubs#import'

  root :to => 'hubs#index'
end
