Rails.application.routes.draw do
  root 'images#index'
  devise_for :users
  resources :images

  get 'images/index_list', to: 'images#index_list', as: 'images_index_list'
end
