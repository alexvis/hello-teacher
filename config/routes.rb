Rails.application.routes.draw do
  root "welcome#index"
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :welcome, only: [:index]
  resources :users
  resources :schools



  namespace :api do
    namespace :v1 do
      resources :schools
    end
  end

  namespace :admin do
    resources :users, only: :show do post :generate_new_password_email
    end
  end

  resources :users do
    resources :classrooms
  end

end
