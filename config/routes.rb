Rails.application.routes.draw do
  devise_for :users
  root "static_pages#home"

  as :user do
    get 'users', :to => 'events#index', :as => :user_root
  end

  get "static_pages/about", :as => 'about'
  get "static_pages/about_michelle", :as => 'about_michelle'

  resources :users
  resources :events do
    resources :event_attendees
  end
end
