class ShowsController < ApplicationController

  def show
    buffer = open("https://api.themoviedb.org/3/tv/"+params[:id]+"?api_key="+@@api_key+"&language="+@@language).read
    @show = JSON.parse(buffer)
  end

end
