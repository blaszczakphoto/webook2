Rails.application.routes.draw do
  get 'hello_world', to: 'hello_world#index'
  get 'webooks/index'
  get 'webooks/new'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "home#index"
end
