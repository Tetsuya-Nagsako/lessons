Rails.application.routes.draw do
  resources :lessons do
    collection do
      get :user_index
    end
  end
  root "top_pages#top"
  get 'top_pages/help'
  get 'pages/index'
  get 'pages/show'
  devise_for :users
end
