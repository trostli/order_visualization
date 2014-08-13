Rails.application.routes.draw do
  resources :hubs, :only => [:index]

  get 'import', to: 'orders#upload'
  post 'import', to: 'orders#import'

  root :to => 'hubs#index'
end
