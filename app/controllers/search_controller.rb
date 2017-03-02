class SearchController < ApplicationController
    def search
        buffer = open('https://api.themoviedb.org/3/search/multi?query='+URI.encode(params[:query])+'&api_key='+@@api_key+'&language='+@@language+'&include_adult=false').read
        results = JSON.parse(buffer)['results']

        movies = []
        persons = []
        tvshows = []

        results.each do |res|
            case res['media_type']
                when 'tv'
                    tvshows << res
                when 'person'
                    persons << res
                when 'movie'
                    movies << res
            end
        end

        movies.delete_if { |h| h['poster_path'].nil? || h['backdrop_path'].nil? }
        movies.sort_by! { |h| h['popularity'] }
        movies.reverse!

        tvshows.sort_by! { |h| h['popularity'] }
        tvshows.delete_if { |h| h['poster_path'].nil? || h['backdrop_path'].nil? }
        tvshows.reverse!

        persons.delete_if { |h| h['profile_path'].nil? }

        @results = [
            {
                "type" => :movie,
                "link_path" => "movies",
                "section_title" => "Films",
                "results" => movies,
                "poster_link" => "https://image.tmdb.org/t/p/w500",
                "poster_name" => "poster_path"
            },
            {
                "type" =>  :tv,
                "link_path" => "shows",
                "section_title" => "Séries TV",
                "results" => tvshows,
                "poster_link" => "https://image.tmdb.org/t/p/w500",
                "poster_name" => "poster_path"
            },
            {
                "type" =>  :person,
                "link_path" => "peoples",
                "section_title" => "Personnes",
                "results" => persons,
                "poster_link" => "https://image.tmdb.org/t/p/h632",
                "poster_name" => "profile_path"
            }
        ]

        if movies.length > 0
            @cover = 'https://image.tmdb.org/t/p/original' + movies[0]['backdrop_path']
        elsif tvshows.length > 0
            @cover = 'https://image.tmdb.org/t/p/original' + tvshows[0]['backdrop_path']
        elsif persons.length > 0
            begin
                buffer = open('https://api.themoviedb.org/3/person/'+persons[0]['id'].to_s+'/tagged_images?api_key='+@@api_key).read
                images = JSON.parse(buffer)

                if images['results'].length != 0
                    covers = images['results'].delete_if { |h| h['image_type'] != 'backdrop' }
                    if covers.length != 0
                        @cover = 'https://image.tmdb.org/t/p/original' + images['results'][0]['file_path']
                    else
                        @cover = nil
                    end
                else
                    @cover = nil
                end
            rescue OpenURI::HTTPError
                @cover = nil
            end
        end
    end
end

