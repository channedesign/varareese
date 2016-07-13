Rails.application.routes.draw do

  get "admins", to: "admins#index"
  get "admins/sign_up", to: "admins#index"
  
  resources :photo_categories, except: [:show, :new] do 
    collection { post :sort }
  end
  resources :photos, except: [:new] do
    collection { post :sort }
  end
  resources :video_categories, except: [:show, :new] do
    collection { post :sort }
  end
  resources :videos, except: [:show, :new] do
    collection { post :sort }
  end
  devise_for :admins
  resources :contact_forms, only: [:new, :create]
  
  root 'home#index'

end
