class SearchController < ApplicationController
  def search
    buffer = open('https://api.themoviedb.org/3/search/multi?query='+URI.encode(params[:query])+'&api_key='+@@api_key+'&language='+@@language).read
    @results = JSON.parse(buffer)['results']
  end
end
