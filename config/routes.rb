Rails.application.routes.draw do
  devise_for :users
root 'users#index'

resources :users do 
  resources :posts do 
    resources :likes 
    resources :comments 
  end 
end 
namespace :api do
  resources :users, only: [] do
    resources :posts, only: [:index] do
      resources :comments, only: [:index, :create]
      end
    end
  end  

end
