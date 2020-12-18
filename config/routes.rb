Rails.application.routes.draw do
  devise_for :users, controllers:{   registrations: 'users/registrations',
                                     sessions: 'users/sessions' }

  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end

  resources :users do
    resources :microposts
  end

  root 'public#home'
  get  'public/show'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

end
