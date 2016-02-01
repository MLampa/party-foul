Rails.application.routes.draw do
  get 'home/index'

  get 'new/home'

  devise_for :users
  root "static_pages#home"

  as :user do
    get 'users', :to => 'events#index', :as => :user_root
  end

  get "static_pages/about", :as => 'about'
  get "static_pages/about_michelle", :as => 'about_michelle'

  resources :users, only: [:show, :index, :new, :create, :edit, :destroy, :update]

  resources :events, only: [:show, :index, :new, :create, :edit, :destroy, :update] do
    resources :event_attendees, only: [:update, :create]
  end

  resources :event_attendees, only: [:destroy, :update]

end
