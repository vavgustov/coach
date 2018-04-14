Rails.application.routes.draw do
  resources :words
  get 'dashboard/index'

  root 'words#index'
end
