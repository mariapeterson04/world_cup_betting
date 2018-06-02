class MatchesGroupsController < ApplicationController
  def index
    @matches_groups = MatchesGroup.all

    render("matches_groups/index.html.erb")
  end

  def show
    @matches_group = MatchesGroup.find(params[:id])

    render("matches_groups/show.html.erb")
  end

  def new
    @matches_group = MatchesGroup.new

    render("matches_groups/new.html.erb")
  end

  def create
    @matches_group = MatchesGroup.new

    @matches_group.team_one = params[:team_one]
    @matches_group.team_two = params[:team_two]
    @matches_group.date = params[:date]
    @matches_group.location = params[:location]
    @matches_group.groupletter = params[:groupletter]
    @matches_group.city = params[:city]
    @matches_group.goals_one = params[:goals_one]
    @matches_group.goals_two = params[:goals_two]
    @matches_group.winner = params[:winner]

    save_status = @matches_group.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/matches_groups/new", "/create_matches_group"
        redirect_to("/matches_groups")
      else
        redirect_back(:fallback_location => "/", :notice => "Matches group created successfully.")
      end
    else
      render("matches_groups/new.html.erb")
    end
  end

  def edit
    @matches_group = MatchesGroup.find(params[:id])

    render("matches_groups/edit.html.erb")
  end

  def update
    @matches_group = MatchesGroup.find(params[:id])

    @matches_group.team_one = params[:team_one]
    @matches_group.team_two = params[:team_two]
    @matches_group.date = params[:date]
    @matches_group.location = params[:location]
    @matches_group.groupletter = params[:groupletter]
    @matches_group.city = params[:city]
    @matches_group.goals_one = params[:goals_one]
    @matches_group.goals_two = params[:goals_two]
    @matches_group.winner = params[:winner]

    save_status = @matches_group.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/matches_groups/#{@matches_group.id}/edit", "/update_matches_group"
        redirect_to("/matches_groups/#{@matches_group.id}", :notice => "Matches group updated successfully.")
      else
        redirect_back(:fallback_location => "/", :notice => "Matches group updated successfully.")
      end
    else
      render("matches_groups/edit.html.erb")
    end
  end

  def destroy
    @matches_group = MatchesGroup.find(params[:id])

    @matches_group.destroy

    if URI(request.referer).path == "/matches_groups/#{@matches_group.id}"
      redirect_to("/", :notice => "Matches group deleted.")
    else
      redirect_back(:fallback_location => "/", :notice => "Matches group deleted.")
    end
  end
end
