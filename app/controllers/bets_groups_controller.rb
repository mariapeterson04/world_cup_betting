class BetsGroupsController < ApplicationController
  before_action :current_user_must_be_bets_group_user, :only => [:show, :edit, :update, :destroy]

  def current_user_must_be_bets_group_user
    bets_group = BetsGroup.find(params[:id])

    unless current_user == bets_group.user
      redirect_to :back, :alert => "You are not authorized for that."
    end
  end

  def index
    @bets_groups = current_user.bets_groups.page(params[:page]).per(10)

    render("bets_groups/index.html.erb")
  end

  def show
    @bets_group = BetsGroup.find(params[:id])

    render("bets_groups/show.html.erb")
  end

  def new
    @bets_group = BetsGroup.new

    render("bets_groups/new.html.erb")
  end

  def create
    @bets_group = BetsGroup.new

    @bets_group.user_id = params[:user_id]
    @bets_group.match_id = params[:match_id]
    @bets_group.bet_team_one = params[:bet_team_one]
    @bets_group.bet_team_two = params[:bet_team_two]
    @bets_group.team_one = params[:team_one]
    @bets_group.team_two = params[:team_two]
    @bets_group.date = params[:date]
    @bets_group.winner = params[:winner]

    save_status = @bets_group.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/bets_groups/new", "/create_bets_group"
        redirect_to("/bets_groups")
      else
        redirect_back(:fallback_location => "/", :notice => "Bets group created successfully.")
      end
    else
      render("bets_groups/new.html.erb")
    end
  end

  def edit
    @bets_group = BetsGroup.find(params[:id])

    render("bets_groups/edit.html.erb")
  end

  def update
    @bets_group = BetsGroup.find(params[:id])
    @bets_group.match_id = params[:match_id]
    @bets_group.bet_team_one = params[:bet_team_one]
    @bets_group.bet_team_two = params[:bet_team_two]
    @bets_group.team_one = params[:team_one]
    @bets_group.team_two = params[:team_two]
    @bets_group.date = params[:date]
    @bets_group.winner = params[:winner]

    save_status = @bets_group.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/bets_groups/#{@bets_group.id}/edit", "/update_bets_group"
        redirect_to("/bets_groups/#{@bets_group.id}", :notice => "Bets group updated successfully.")
      else
        redirect_back(:fallback_location => "/", :notice => "Bets group updated successfully.")
      end
    else
      render("bets_groups/edit.html.erb")
    end
  end

  def destroy
    @bets_group = BetsGroup.find(params[:id])

    @bets_group.destroy

    if URI(request.referer).path == "/bets_groups/#{@bets_group.id}"
      redirect_to("/", :notice => "Bets group deleted.")
    else
      redirect_back(:fallback_location => "/", :notice => "Bets group deleted.")
    end
  end
end
