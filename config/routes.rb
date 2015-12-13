Rails.application.routes.draw do

  devise_for :users, skip: [:registrations],  controllers: {registrations: 'users/registrations'}
  as :user do

    get   '/join' => 'users/registrations#new',    as: 'new_user_registration'
    post  '/join' => 'users/registrations#create', as: 'user_registration'

  end


  root to: 'pages#home'

  scope '/graphql' do
    post "/", to: "graphql#create"
  end

  get '/editor', to: 'pages#editor', as: :editor

  resources :posts do
    resources :comments
  end

end
