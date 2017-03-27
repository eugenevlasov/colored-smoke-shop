Rails.application.routes.draw do
  devise_for :admins


  resources :catalog, controller: 'base_goods_descriptions'
  resources :goods,   except: [:show]
  resources :images,  only: [:destroy]

  resource :cart, only: [:show] do
    put 'add/:id',    to: 'carts#add', as: :add_to
    put 'remove/:id', to: 'carts#remove', as: :remove_from
  end

  resources :orders do
    get 'status'
    put 'status', to: 'orders#change'
  end

  get 'delivery'  => 'pages#show', page: 'delivery'
  get 'payment'   => 'pages#show', page: 'payment'
  get 'contacts'  => 'pages#show', page: 'contacts'

  root :to => 'base_goods_descriptions#index'

  # all unknown request match to 404 via Pages controller
  match '*path' => 'pages#show', via: :all
end
