Rails.application.routes.draw do
  devise_for :users, controllers:{   registrations: 'users/registrations',
                                     sessions: 'users/sessions' }

  # devise_scope :user do
  #   get '/users/sign_out' => 'devise/sessions#destroy'
  # end

  resources :users , only: [:show]

  resources :microposts do
      resource :favorites, only: [:create, :destroy]
      resources :comments,  only: [:create, :destroy]
  end

  resources :tags do
    get 'microposts', to: 'microposts#select'
  end

  get '/search', to: 'microposts#search', as: 'search'

  resources :users do
    member do
      get :following, :followers
    end
  end

  resources :relationships,       only: [:create, :destroy]


  root 'public#home'
  get  'public/show'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
