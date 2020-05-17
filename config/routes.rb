Rails.application.routes.draw do
  root 'pages#home'
  get 'about', to: 'pages#about'
  resources :articles
  # resources :blogs, only:[:show, :index, :new, :create, :edit, :update, :destroy]
  resources :blogs
end
