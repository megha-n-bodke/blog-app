Rails.application.routes.draw do
root 'users#index'
get 'users/:id', to: 'users#show', as: 'user'
get 'users/:author_id/posts', to: 'posts#index', as: 'user_posts'
get 'user/:author_id/posts/:id', to: 'posts#show', as: 'user_post'

end
