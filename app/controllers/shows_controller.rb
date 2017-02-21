class ShowsController < ApplicationController

  def index
    api_key = "32c2115b63d2b870f0f58d85da6a8183"
    language = "fr-FR"

    buffer = open("https://api.themoviedb.org/3/discover/tv?api_key="+api_key+"&language="+language+"&sort_by=popularity.desc&include_adult=false&include_video=false&page=1").read

    @shows = JSON.parse(buffer)['results']
  end

  def show
    api_key = "32c2115b63d2b870f0f58d85da6a8183"
    language = "fr-FR"

    buffer = open("https://api.themoviedb.org/3/tv/"+params[:id]+"?api_key="+api_key+"&language="+language).read
    @show = JSON.parse(buffer)
  end

end
