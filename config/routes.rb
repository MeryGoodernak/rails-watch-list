Rails.application.routes.draw do
  # get 'lists/index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root 'lists#index'
  resources :lists, except: %i[index destroy edit update] do
    resources :bookmarks, only: %i[new create]
  end
  delete 'bookmarks/:id', to: 'bookmarks#destroy'
end
