class MoviesController < ApplicationController


  def index
    api_key = "32c2115b63d2b870f0f58d85da6a8183"
    language = "fr-FR"

    buffer = open("https://api.themoviedb.org/3/discover/movie?api_key="+api_key+"&language="+language+"&sort_by=popularity.desc&include_adult=false&include_video=false&page=1").read

    @movies = JSON.parse(buffer)['results']
  end

  def show
    api_key = "32c2115b63d2b870f0f58d85da6a8183"
    language = "fr-FR"

    buffer = open("https://api.themoviedb.org/3/movie/"+params[:id]+"?api_key="+api_key+"&language="+language).read
    @movie = JSON.parse(buffer)

    buffer = open("https://api.themoviedb.org/3/movie/"+params[:id]+"/credits?api_key="+api_key).read
    @cast = JSON.parse(buffer)['cast']

    buffer = open("https://api.themoviedb.org/3/movie/"+params[:id]+"/recommendations?api_key="+api_key+"&language="+language).read
    @reco = JSON.parse(buffer)['results']
  end
  
end
