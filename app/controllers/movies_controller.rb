class MoviesController < ApplicationController

  def show
    buffer = open('https://api.themoviedb.org/3/movie/'+params[:id]+'?api_key='+@@api_key+'&language='+@@language).read
    @movie = JSON.parse(buffer)

    buffer = open('https://api.themoviedb.org/3/movie/'+params[:id]+'/credits?api_key='+@@api_key).read
    @cast = JSON.parse(buffer)

    @directors = []
    @cast['crew'].each do |crewMember|
      if crewMember['job'] == 'Director'
        @directors << crewMember
      end
    end

    puts @directors

    buffer = open('https://api.themoviedb.org/3/movie/'+params[:id]+'/recommendations?api_key='+@@api_key+'&language='+@@language).read
    @reco = JSON.parse(buffer)['results']
  end
  
end
