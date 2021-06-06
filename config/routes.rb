Rails.application.routes.draw do
  get '/search' => 'search#search'
  get 'favorites/create'
  get 'favorites/destroy'
  devise_for :users
  root to:'homes#top'
  get 'home/about' => 'homes#about', as: 'about'
  resources :users do
    resource :relationships, only: [:create, :destroy]
    get 'followings' => 'relationships#followings', as: 'followings'
    get 'followers' =>'relationships#followers', as: 'followers'
  end 
  resources :books do
    resources :post_comments, only: [:create, :destroy]
    resource :favorites, only: [:create, :destroy]
  end
  post 'follow/:id' => 'relationship#follow', as: 'follow'
  post 'unfollow/:id' => 'relationship#unfollow', as: 'unfollow'
end
