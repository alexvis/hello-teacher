Rails.application.routes.draw do
  root 'welcome#index'


  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html


  resources :welcome, only: [:index]
  resources :users
  resources :schools
  resources :classrooms


  resources :users do
    resources :schools do
      resources :classrooms
    end
  end

  namespace :api do
    namespace :v1 do
      resources :users do
        resources :schools do
          resources :classrooms
        end
      end
      resources :classrooms
    end
  end

  namespace :admin do
    resources :users, only: :show do post :generate_new_password_email
    end
  end


end

#
# get 'home/show'
#
#   get 'auth/:provider/callback', to: 'sessions#create'
#   get 'auth/failure', to: redirect('/')
#   get 'signout', to: 'sessions#destroy', as: 'signout'
#
#   resources :sessions, only: [:create, :destroy]
#   resource :home, only: [:show]
#
#   namespace :api do
#     namespace :v1 do
#       resources :decks, only: [:index, :show, :create, :update]
#     end
#   end
#
#   root to: "home#show"
# end
