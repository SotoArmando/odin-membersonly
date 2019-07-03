Rails.application.routes.draw do
  root 'posts#index'
  get '/sign_in', to:'sessions#new'
  get '/index', to:'sessions#edit'
  post '/sign_in' ,to:'sessions#create' , as: 'sign_in_path'
  delete '/sign_out' ,to:'sessions#destroy'
  resources :posts

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
