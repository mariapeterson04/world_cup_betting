Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  root :to => "bets_groups#index"
  # Routes for the Bets_knockout resource:
  # CREATE
  get "/bets_knockouts/new", :controller => "bets_knockouts", :action => "new"
  post "/create_bets_knockout", :controller => "bets_knockouts", :action => "create"

  # READ
  get "/bets_knockouts", :controller => "bets_knockouts", :action => "index"
  get "/bets_knockouts/:id", :controller => "bets_knockouts", :action => "show"

  # UPDATE
  get "/bets_knockouts/:id/edit", :controller => "bets_knockouts", :action => "edit"
  post "/update_bets_knockout/:id", :controller => "bets_knockouts", :action => "update"

  # DELETE
  get "/delete_bets_knockout/:id", :controller => "bets_knockouts", :action => "destroy"
  #------------------------------

  # Routes for the Matches_knockout resource:
  # CREATE
  get "/matches_knockouts/new", :controller => "matches_knockouts", :action => "new"
  post "/create_matches_knockout", :controller => "matches_knockouts", :action => "create"

  # READ
  get "/matches_knockouts", :controller => "matches_knockouts", :action => "index"
  get "/matches_knockouts/:id", :controller => "matches_knockouts", :action => "show"

  # UPDATE
  get "/matches_knockouts/:id/edit", :controller => "matches_knockouts", :action => "edit"
  post "/update_matches_knockout/:id", :controller => "matches_knockouts", :action => "update"

  # DELETE
  get "/delete_matches_knockout/:id", :controller => "matches_knockouts", :action => "destroy"
  #------------------------------

  # Routes for the Result resource:
  # CREATE
  get "/results/new", :controller => "results", :action => "new"
  post "/create_result", :controller => "results", :action => "create"

  # READ
  get "/results", :controller => "results", :action => "index"
  get "/results/:id", :controller => "results", :action => "show"

  # UPDATE
  get "/results/:id/edit", :controller => "results", :action => "edit"
  post "/update_result/:id", :controller => "results", :action => "update"

  # DELETE
  get "/delete_result/:id", :controller => "results", :action => "destroy"
  #------------------------------

  # Routes for the Matches_group resource:
  # CREATE
  get "/matches_groups/new", :controller => "matches_groups", :action => "new"
  post "/create_matches_group", :controller => "matches_groups", :action => "create"

  # READ
  get "/matches_groups", :controller => "matches_groups", :action => "index"
  get "/matches_groups/:id", :controller => "matches_groups", :action => "show"

  # UPDATE
  get "/matches_groups/:id/edit", :controller => "matches_groups", :action => "edit"
  post "/update_matches_group/:id", :controller => "matches_groups", :action => "update"

  # DELETE
  get "/delete_matches_group/:id", :controller => "matches_groups", :action => "destroy"
  #------------------------------

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
