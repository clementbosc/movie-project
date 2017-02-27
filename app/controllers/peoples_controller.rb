class PeoplesController < ApplicationController

  def show
    api_key = '32c2115b63d2b870f0f58d85da6a8183'
    language = 'en-US'

    buffer = open('https://api.themoviedb.org/3/person/'+params[:id]+'?api_key='+api_key+'&language='+language).read
    @people = JSON.parse(buffer)

    buffer = open('https://api.themoviedb.org/3/person/'+params[:id]+'/tagged_images?api_key='+api_key).read
    @images = JSON.parse(buffer)

    if @images['results'].length != 0
      @covers = @images['results'].delete_if { |h| h['image_type'] != 'backdrop' }
      if @covers.length != 0
        @cover = 'https://image.tmdb.org/t/p/original' + @images['results'][0]['file_path']
      else
        @cover = nil
      end
    else
      @cover = nil
    end

    buffer = open('https://api.themoviedb.org/3/person/'+params[:id]+'/movie_credits?api_key='+api_key).read
    @credits = JSON.parse(buffer)

    @movies_played = @credits['cast']
    @movies_played.delete_if { |h| Date.parse(h['release_date']) > Date.today }
    @movies_played.sort_by! { |h| h['release_date'] }
    @movies_played.reverse!

  end

end
