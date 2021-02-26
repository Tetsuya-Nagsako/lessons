Rails.application.routes.draw do
  root "top_pages#top"
  get 'top_pages/help'
  get 'top_pages/home'
  post '/top_pages/guest_sign_in', to: 'top_pages#new_guest'
  
  resources :lessons do
    collection do
      get :user_index
    end
    resources :comments
  end
  
  post 'lessons/:id/charge', to: "charges#create", as: "charge"
  post 'mypage/bought_lesson/:id', to: "charges#attending_complete", as: 'attending_complete'
  
  devise_for :users
  
  scope :mypage do
    resources :users
  end
end
