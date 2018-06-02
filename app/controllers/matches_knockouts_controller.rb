class MatchesKnockoutsController < ApplicationController
  def index
    @matches_knockouts = MatchesKnockout.all
    @location_hash = Gmaps4rails.build_markers(@matches_knockouts.where.not(:city_latitude => nil)) do |matches_knockout, marker|
      marker.lat matches_knockout.city_latitude
      marker.lng matches_knockout.city_longitude
      marker.infowindow "<h5><a href='/matches_knockouts/#{matches_knockout.id}'>#{matches_knockout.team_one}</a></h5><small>#{matches_knockout.city_formatted_address}</small>"
    end
    @location_hash = Gmaps4rails.build_markers(@matches_knockouts.where.not(:location_latitude => nil)) do |matches_knockout, marker|
      marker.lat matches_knockout.location_latitude
      marker.lng matches_knockout.location_longitude
      marker.infowindow "<h5><a href='/matches_knockouts/#{matches_knockout.id}'>#{matches_knockout.team_one}</a></h5><small>#{matches_knockout.location_formatted_address}</small>"
    end

    render("matches_knockouts/index.html.erb")
  end

  def show
    @bets_knockout = BetsKnockout.new
    @matches_knockout = MatchesKnockout.find(params[:id])

    render("matches_knockouts/show.html.erb")
  end

  def new
    @matches_knockout = MatchesKnockout.new

    render("matches_knockouts/new.html.erb")
  end

  def create
    @matches_knockout = MatchesKnockout.new

    @matches_knockout.team_one = params[:team_one]
    @matches_knockout.team_two = params[:team_two]
    @matches_knockout.date = params[:date]
    @matches_knockout.location = params[:location]
    @matches_knockout.round = params[:round]
    @matches_knockout.city = params[:city]
    @matches_knockout.goals_one = params[:goals_one]
    @matches_knockout.goals_two = params[:goals_two]
    @matches_knockout.winner = params[:winner]

    save_status = @matches_knockout.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/matches_knockouts/new", "/create_matches_knockout"
        redirect_to("/matches_knockouts")
      else
        redirect_back(:fallback_location => "/", :notice => "Matches knockout created successfully.")
      end
    else
      render("matches_knockouts/new.html.erb")
    end
  end

  def edit
    @matches_knockout = MatchesKnockout.find(params[:id])

    render("matches_knockouts/edit.html.erb")
  end

  def update
    @matches_knockout = MatchesKnockout.find(params[:id])

    @matches_knockout.team_one = params[:team_one]
    @matches_knockout.team_two = params[:team_two]
    @matches_knockout.date = params[:date]
    @matches_knockout.location = params[:location]
    @matches_knockout.round = params[:round]
    @matches_knockout.city = params[:city]
    @matches_knockout.goals_one = params[:goals_one]
    @matches_knockout.goals_two = params[:goals_two]
    @matches_knockout.winner = params[:winner]

    save_status = @matches_knockout.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/matches_knockouts/#{@matches_knockout.id}/edit", "/update_matches_knockout"
        redirect_to("/matches_knockouts/#{@matches_knockout.id}", :notice => "Matches knockout updated successfully.")
      else
        redirect_back(:fallback_location => "/", :notice => "Matches knockout updated successfully.")
      end
    else
      render("matches_knockouts/edit.html.erb")
    end
  end

  def destroy
    @matches_knockout = MatchesKnockout.find(params[:id])

    @matches_knockout.destroy

    if URI(request.referer).path == "/matches_knockouts/#{@matches_knockout.id}"
      redirect_to("/", :notice => "Matches knockout deleted.")
    else
      redirect_back(:fallback_location => "/", :notice => "Matches knockout deleted.")
    end
  end
end
