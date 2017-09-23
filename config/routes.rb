Rails.application.routes.draw do
  
  devise_for :users, :controllers => { :omniauth_callbacks => "callbacks"}
  root to: 'welcome#index'
  
  get 'welcome/index'

  resources :textbooks, :courses, :adoptions

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
