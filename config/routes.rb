Rails.application.routes.draw do
  root 'images#index'
  devise_for :users

  # Custom route for image index list
  get 'images/index_list', to: 'images#index_list', as: 'images_index_list'

  # Resourceful route for images
  resources :images
end
