Rails.application.routes.draw do
  resources :backup_media
  resources :components
  get 'backups/search' => 'backups#search'
  resources :backups
  root 'backups#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
