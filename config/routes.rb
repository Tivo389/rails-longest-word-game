Rails.application.routes.draw do
  root to: 'words#createGrid'
  # get 'createGrid', to: 'words#createGrid'
  get 'scoreGrid', to: 'words#scoreGrid'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end