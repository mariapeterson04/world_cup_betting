class BetsController < ApplicationController
  before_action :current_user_must_be_bet_user, :only => [:edit, :update, :destroy]

  def current_user_must_be_bet_user
    bet = Bet.find(params[:id])

    unless current_user == bet.user
      redirect_to :back, :alert => "You are not authorized for that."
    end
  end

  def index
    @q = Bet.ransack(params[:q])
    @bets = @q.result(:distinct => true).includes(:user, :matches_group).page(params[:page]).per(10)

    render("bets/index.html.erb")
  end

  def show
    @bet = Bet.find(params[:id])

    render("bets/show.html.erb")
  end

  def new
    @bet = Bet.new

    render("bets/new.html.erb")
  end

  def create
    @bet = Bet.new

    @bet.bet_team_one = params[:bet_team_one]
    @bet.bet_team_two = params[:bet_team_two]
    @bet.user_id = params[:user_id]
    @bet.matches_group_id = params[:matches_group_id]

    save_status = @bet.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/bets/new", "/create_bet"
        redirect_to("/bets")
      else
        redirect_back(:fallback_location => "/", :notice => "Bet created successfully.")
      end
    else
      render("bets/new.html.erb")
    end
  end

  def edit
    @bet = Bet.find(params[:id])

    render("bets/edit.html.erb")
  end

  def update
    @bet = Bet.find(params[:id])

    @bet.bet_team_one = params[:bet_team_one]
    @bet.bet_team_two = params[:bet_team_two]
    @bet.user_id = params[:user_id]
    @bet.matches_group_id = params[:matches_group_id]

    save_status = @bet.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/bets/#{@bet.id}/edit", "/update_bet"
        redirect_to("/bets/#{@bet.id}", :notice => "Bet updated successfully.")
      else
        redirect_back(:fallback_location => "/", :notice => "Bet updated successfully.")
      end
    else
      render("bets/edit.html.erb")
    end
  end

  def destroy
    @bet = Bet.find(params[:id])

    @bet.destroy

    if URI(request.referer).path == "/bets/#{@bet.id}"
      redirect_to("/", :notice => "Bet deleted.")
    else
      redirect_back(:fallback_location => "/", :notice => "Bet deleted.")
    end
  end
end
