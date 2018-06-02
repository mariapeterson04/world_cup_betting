Rails.application.routes.draw do
  # Routes for the Bets_group resource:
  # CREATE
  get "/bets_groups/new", :controller => "bets_groups", :action => "new"
  post "/create_bets_group", :controller => "bets_groups", :action => "create"

  # READ
  get "/bets_groups", :controller => "bets_groups", :action => "index"
  get "/bets_groups/:id", :controller => "bets_groups", :action => "show"

  # UPDATE
  get "/bets_groups/:id/edit", :controller => "bets_groups", :action => "edit"
  post "/update_bets_group/:id", :controller => "bets_groups", :action => "update"

  # DELETE
  get "/delete_bets_group/:id", :controller => "bets_groups", :action => "destroy"
  #------------------------------

  devise_for :users
  # Routes for the User resource:
  # READ
  get "/users", :controller => "users", :action => "index"
  get "/users/:id", :controller => "users", :action => "show"


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
