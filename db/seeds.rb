# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

10.times do
  rando = rand 100

  url = "https://tmdb.lewagon.com/movie/#{rando}"

  movies = JSON.parse(URI.open(url).read)
  unless !movies['original_title'].nil? && !movies['overview'].nil? && !movies['vote_average'].nil? && movies['overview'] != ''
    next
  end

  Movie.create!(
    title: movies['title'],
    overview: movies['overview'],
    rating: movies['vote_average'],
    poster_url: "https://image.tmdb.org/t/p/original/#{movies['poster_path']}"
  )
end
