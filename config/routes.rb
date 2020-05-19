Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get "/", to: "pages#index", as: "root"
  get "/listings/", to: "listings#index", as: "listings"
  get "/listings/new", to: "listings#new", as: "new_listing"
  post "/listings/", to: "listings#create"
  get "/listings/:id", to: "listings#show", as: "listing"

  get "/listings/:id/edit", to: "listings#edit", as: "edit_listing"
  delete "/listings/:id", to: "listings#destroy"
  patch "/listings/:id", to: "listings#update"
  put "/listings/:id", to: "listings#update"

#Questions controller
  post "/listings/:id", to: "questions#create"

end
