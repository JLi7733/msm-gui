class MoviesController < ApplicationController
  def index
    matching_movies = Movie.all
    @list_of_movies = matching_movies.order({ :created_at => :desc })

    render({ :template => "movie_templates/index" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_movies = Movie.where({ :id => the_id })
    @the_movie = matching_movies.at(0)

    render({ :template => "movie_templates/show" })
  end

  def insert
    movie = Movie.new
    movie.title = params.fetch("query_title")
    movie.year = params.fetch("query_year")
    movie.duration = params.fetch("query_duration")
    movie.description = params.fetch("query_description")
    movie.image = params.fetch("query_image")
    movie.director_id = params.fetch("query_director_id")
    movie.save
    redirect_to("/movies")
  end

  def delete
    id = params.fetch("id")
    matching_records = Movie.where({ :id => id })
    movie = matching_records.at(0)
    movie.destroy
    redirect_to("/movies")
  end

  def modify
    id = params.fetch("id")
    matching_records = Movie.where({ :id => id })
    movie = matching_records.at(0)
    movie.title = params.fetch("query_title")
    movie.year = params.fetch("query_year")
    movie.duration = params.fetch("query_duration")
    movie.description = params.fetch("query_description")
    movie.image = params.fetch("query_image")
    movie.director_id = params.fetch("query_director_id")
    movie.save
    redirect_to("/movies/" + id)
  end
end
