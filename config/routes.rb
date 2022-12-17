Rails.application.routes.draw do
  get 'likes/create'
root 'users#index'

resources :users do 
  resources :posts do 
    resources :likes 
    resources :comments 
  end 
end  

end
