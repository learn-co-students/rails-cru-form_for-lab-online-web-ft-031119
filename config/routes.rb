Rails.application.routes.draw do
  resources :songs, only:[:index, :create, :new, :show, :edit, :update]
  resources :genres, only:[:create, :new, :show, :edit, :update]
  resources :artists, only:[:create, :new, :show, :update, :edit]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
