MattRecipeBook::Application.routes.draw do

  resources :users


  resources :categories

  resources :recipes

  match '/login' => 'sessions#new', :as => 'login'
  match '/logout' => 'sessions#destroy', :as => 'logout'
  match '/authenticate' => 'sessions#create', :as => 'authenticate'

  root :to => 'pages#index', :as => 'root'

end
