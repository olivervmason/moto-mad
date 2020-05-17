Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get "/", to: "pages#index", as: "root"
  get "/listings/", to: "listings#index", as: "listings"
  get "/listings/new", to: "listings#new", as: "new_listing"
  post "/listings/", to: "listings#create"
  get "/listings/:id", to: "listings#show", as: "listing"

end
