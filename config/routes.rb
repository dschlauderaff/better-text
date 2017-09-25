Rails.application.routes.draw do
  
  get 'reports/index'
  get 'reports/courses_without_books'
  post 'adoptions/order_textbook'

  devise_for :users, :controllers => { :omniauth_callbacks => "callbacks"}
  root to: 'welcome#index'

  resources :textbooks, :courses, :adoptions
  
  resources :courses, only: [:show] do
    resources :textbooks, only: [:show, :new]
  end


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
