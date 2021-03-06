class WelcomeController < ApplicationController
  def index
    api_key = "32c2115b63d2b870f0f58d85da6a8183"
    language = "fr-FR"
    region = "FR"

    buffer = open("https://api.themoviedb.org/3/movie/now_playing?api_key="+api_key+"&language="+language+"&region="+region).read
    @movies = JSON.parse(buffer)['results']

    buffer = open("https://api.themoviedb.org/3/tv/on_the_air?api_key="+api_key+"&language="+language).read
    @shows = JSON.parse(buffer)['results']

    num = rand(0..19)
    buffer = open("https://api.themoviedb.org/3/discover/movie?api_key="+api_key+"&language="+language+"&sort_by=popularity.desc&include_adult=false&include_video=false&page=1").read
    @cover = "https://image.tmdb.org/t/p/original"+JSON.parse(buffer)['results'][num]['backdrop_path'];


  end
end
