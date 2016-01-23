Rails.application.routes.draw do
  devise_for :users
  resources :users, only: [:show] do
    member do
      get :follow
      get :unfollow
    end
  end
  resources :articles do
    resources :comments
    member do
    	get 'like', to: 'articles#upvote'
    	get 'dislike', to: 'articles#downvote'
    end
  end
  root 'articles#index'
  
end
