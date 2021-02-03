Rails.application.routes.draw do
  root "top_pages#top"
  get 'top_pages/help'
  get 'pages/index'
  get 'pages/show'
  devise_for :users
end
