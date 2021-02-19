Rails.application.routes.draw do
  root "top_pages#top"
  get 'top_pages/help'
  get 'top_pages/home'
  
  
  resources :lessons do
    collection do
      get :user_index
    end
  end
  
  post "lessons/:id/charge", to: "charges#create", as: "charge"
  
  devise_for :users
  
  scope :mypage do
    resources :users
  end
end
