def add_movies_to_db(movies_request)
  movies_request['results'].each do |result|
    p result
    Movie.create!(title: result['title'], overview: result['overview'], poster_url: "https://image.tmdb.org/t/p/w500#{result['poster_path']}", rating: result['vote_average'])
  end
end

url = 'http://tmdb.lewagon.com/movie/top_rated?page='
page = 1
movie_request = JSON.parse(URI.open("#{url}#{page}").read)
add_movies_to_db(movie_request)
total_pages = 300
while page < total_pages
  page += 1
  puts "fetching page: #{page}"
  new_movie_request = JSON.parse(URI.open("#{url}#{page}").read)
  add_movies_to_db(new_movie_request)
end
