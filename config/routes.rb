Rails.application.routes.draw do
  root "top_pages#top"
  get 'top_pages/help'
  
  resources :pages
  post 'pages/new', to: "pages#create"
  
  resources :lessons do
    collection do
      get :user_index
    end
  end
  
  post "lessons/:id/charge", to: "charges#create", as: "charge"
  
  devise_for :users
end
