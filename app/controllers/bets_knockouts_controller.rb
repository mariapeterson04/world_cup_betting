class BetsKnockoutsController < ApplicationController
  before_action :current_user_must_be_bets_knockout_user, :only => [:edit, :update, :destroy]

  def current_user_must_be_bets_knockout_user
    bets_knockout = BetsKnockout.find(params[:id])

    unless current_user == bets_knockout.user
      redirect_to :back, :alert => "You are not authorized for that."
    end
  end

  def index
    @q = BetsKnockout.ransack(params[:q])
    @bets_knockouts = @q.result(:distinct => true).includes(:user, :user_signed, :result).page(params[:page]).per(10)

    render("bets_knockouts/index.html.erb")
  end

  def show
    @bets_knockout = BetsKnockout.find(params[:id])

    render("bets_knockouts/show.html.erb")
  end

  def new
    @bets_knockout = BetsKnockout.new

    render("bets_knockouts/new.html.erb")
  end

  def create
    @bets_knockout = BetsKnockout.new

    @bets_knockout.user_id = params[:user_id]
    @bets_knockout.match_id = params[:match_id]
    @bets_knockout.bet_team_one = params[:bet_team_one]
    @bets_knockout.bet_team_two = params[:bet_team_two]
    @bets_knockout.team_one = params[:team_one]
    @bets_knockout.team_two = params[:team_two]
    @bets_knockout.date = params[:date]
    @bets_knockout.winner = params[:winner]

    save_status = @bets_knockout.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/bets_knockouts/new", "/create_bets_knockout"
        redirect_to("/bets_knockouts")
      else
        redirect_back(:fallback_location => "/", :notice => "Bets knockout created successfully.")
      end
    else
      render("bets_knockouts/new.html.erb")
    end
  end

  def edit
    @bets_knockout = BetsKnockout.find(params[:id])

    render("bets_knockouts/edit.html.erb")
  end

  def update
    @bets_knockout = BetsKnockout.find(params[:id])
    @bets_knockout.match_id = params[:match_id]
    @bets_knockout.bet_team_one = params[:bet_team_one]
    @bets_knockout.bet_team_two = params[:bet_team_two]
    @bets_knockout.team_one = params[:team_one]
    @bets_knockout.team_two = params[:team_two]
    @bets_knockout.date = params[:date]
    @bets_knockout.winner = params[:winner]

    save_status = @bets_knockout.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/bets_knockouts/#{@bets_knockout.id}/edit", "/update_bets_knockout"
        redirect_to("/bets_knockouts/#{@bets_knockout.id}", :notice => "Bets knockout updated successfully.")
      else
        redirect_back(:fallback_location => "/", :notice => "Bets knockout updated successfully.")
      end
    else
      render("bets_knockouts/edit.html.erb")
    end
  end

  def destroy
    @bets_knockout = BetsKnockout.find(params[:id])

    @bets_knockout.destroy

    if URI(request.referer).path == "/bets_knockouts/#{@bets_knockout.id}"
      redirect_to("/", :notice => "Bets knockout deleted.")
    else
      redirect_back(:fallback_location => "/", :notice => "Bets knockout deleted.")
    end
  end
end
