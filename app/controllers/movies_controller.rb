class MoviesController < ApplicationController

  # GET: /movies
  get "/movies" do

    erb :"/movies/index.html"
  end


  # GET: /movies/5
  get "/movies/:id" do
    @movie = Movie.find_by_id(params[:id])
    @session = session
    erb :"/movies/show.html"
  end

end
