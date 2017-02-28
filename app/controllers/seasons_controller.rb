class SeasonsController < ApplicationController
  def show

    buffer = open("https://api.themoviedb.org/3/tv/"+params[:show]+"?api_key="+@@api_key+"&language="+@@language).read
    @show = JSON.parse(buffer)


    buffer = open("https://api.themoviedb.org/3/tv/"+params[:show]+"/season/"+params[:season]+"?api_key="+@@api_key+"&language="+@@language).read
    @season = JSON.parse(buffer)


  end
end
