Rails.application.routes.draw do
  root 'welcome#index'


  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html


  resources :welcome, only: [:index]
  resources :users
  resources :schools
  resources :classrooms
  resources :students
  resources :tokens, only: [:destroy, :create]
  resources :comments, only: [:destroy, :create]

  resources :users do
    resources :schools do
      resources :classrooms do
        resources :students
      end
    end
  end

  resources :classrooms do
    resources :comments, only: [:destroy, :create]
    resources :users do
      resources :comments, only: [:destroy, :create]
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
