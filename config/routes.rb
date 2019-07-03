Rails.application.routes.draw do
  get '/sign_in', to:'sessions#new'
  post '/sign_in' ,to:'sessions#create' , as: 'sign_in_path'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
