Rails.application.routes.draw do
  resources :words
  get 'trainer/index'
  get 'trainer/check'
  root 'words#index'
end
