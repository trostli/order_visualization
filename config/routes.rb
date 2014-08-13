Rails.application.routes.draw do
  resources :hubs, :only => [:index]

  get 'order/import', to: 'orders#upload'
  post 'order/import', to: 'orders#import'

  get 'hub/import', to: 'hubs#upload'
  post 'hub/import', to: 'hubs#import'

  root :to => 'hubs#index'
end
