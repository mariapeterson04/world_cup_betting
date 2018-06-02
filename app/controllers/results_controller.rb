class ResultsController < ApplicationController
  def index
    @results = Result.all

    render("results/index.html.erb")
  end

  def show
    @result = Result.find(params[:id])

    render("results/show.html.erb")
  end

  def new
    @result = Result.new

    render("results/new.html.erb")
  end

  def create
    @result = Result.new

    @result.users_score = params[:users_score]
    @result.rank = params[:rank]
    @result.username = params[:username]
    @result.bet_id = params[:bet_id]

    save_status = @result.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/results/new", "/create_result"
        redirect_to("/results")
      else
        redirect_back(:fallback_location => "/", :notice => "Result created successfully.")
      end
    else
      render("results/new.html.erb")
    end
  end

  def edit
    @result = Result.find(params[:id])

    render("results/edit.html.erb")
  end

  def update
    @result = Result.find(params[:id])

    @result.users_score = params[:users_score]
    @result.rank = params[:rank]
    @result.username = params[:username]
    @result.bet_id = params[:bet_id]

    save_status = @result.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/results/#{@result.id}/edit", "/update_result"
        redirect_to("/results/#{@result.id}", :notice => "Result updated successfully.")
      else
        redirect_back(:fallback_location => "/", :notice => "Result updated successfully.")
      end
    else
      render("results/edit.html.erb")
    end
  end

  def destroy
    @result = Result.find(params[:id])

    @result.destroy

    if URI(request.referer).path == "/results/#{@result.id}"
      redirect_to("/", :notice => "Result deleted.")
    else
      redirect_back(:fallback_location => "/", :notice => "Result deleted.")
    end
  end
end
