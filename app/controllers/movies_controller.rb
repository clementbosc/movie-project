class MoviesController < ApplicationController

    def show
        puts params[:id]
        buffer = open('https://api.themoviedb.org/3/movie/'+params[:id]+'?api_key='+@@api_key+'&language='+@@language).read
        @movie = JSON.parse(buffer)

        buffer = open('https://api.themoviedb.org/3/movie/'+params[:id]+'/credits?api_key='+@@api_key).read
        @cast = JSON.parse(buffer)
        @cast['cast'].delete_if { |h| h['profile_path'].nil? }

        @directors = []
        @cast['crew'].each do |crewMember|
            if crewMember['job'] == 'Director'
                @directors << crewMember
            end
        end

        buffer = open('https://api.themoviedb.org/3/movie/'+params[:id]+'/recommendations?api_key='+@@api_key+'&language='+@@language).read
        @reco = JSON.parse(buffer)['results']
        @reco.delete_if { |h| h['poster_path'].nil? }

        buffer = open('https://api.themoviedb.org/3/movie/'+params[:id]+'/release_dates?api_key='+@@api_key).read
        release_dates = JSON.parse(buffer)

        release_dates_fr = release_dates['results'].select { |h| h['iso_3166_1'] == 'FR' }
        if release_dates_fr.length != 0
            @release_date = release_dates_fr[0]['release_dates'].select { |h| h['iso_639_1'] == 'fr' }
            if @release_date.length != 0
                @release_date = @release_date[0]['release_date']
                @release_date = DateTime.parse(@release_date)
            else
                @release_date = DateTime.parse(@movie['release_date'])
            end
        else
            @release_date = DateTime.parse(@movie['release_date'])
        end

    end

end
