Rails.application.routes.draw do
  devise_for :users, skip: [:registrations], controllers: { registrations: 'users/registrations' }
  as :user do
    get   '/signup' => 'users/registrations#new',    as: 'new_user_registration'
    post  '/signup' => 'users/registrations#create', as: 'user_registration'
  end

  root to: 'pages#home'
  scope '/graphql' do
    post '/', to: 'graphql#create'
  end

  resources :posts, only: :show

  get 'tag/:tag', to: 'posts#tag', as: :tag
end
