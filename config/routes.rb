Rails.application.routes.draw do
  devise_for :users, controllers:{   registrations: 'users/registrations',
                                     sessions: 'users/sessions' }

  # devise_scope :user do
  #   get '/users/sign_out' => 'devise/sessions#destroy'
  # end

  resources :users , only: [:show]

  resources :microposts do
      resource :favorites, only: [:create, :destroy]
  end

  root 'public#home'
  get  'public/show'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
