Rails.application.routes.draw do
  get 'mobi_files/download/:book_id', to: 'mobi_files#download', as: 'download'

  get 'hello_world', to: 'hello_world#index'
  get 'webooks/index'
  get 'webooks/new'
  post 'webooks/create'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "home#index"
end
