Rails.application.routes.draw do
  
  get 'report/index'

  devise_for :users, :controllers => { :omniauth_callbacks => "callbacks"}
  root to: 'welcome#index'

  
  resources :courses, only: [:show] do
    resources :textbooks, only: [:show, :new]
  end

  resources :textbooks, :courses, :adoptions

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
