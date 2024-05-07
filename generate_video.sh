#!/usr/bin/env bash

set -e

# Create list of movies and tv shows
MOVIES=( "Killers of the Flower Moon (2023) {tmdb-466420} {imdb-tt5537002}/Killers of the Flower Moon (2023).mkv" \
    "The Hunger Games The Ballad of Songbirds & Snakes (2023) {tmdb-695721} {imdb-tt10545296}/The Hunger Games The Ballad of Songbirds & Snakes (2023).mkv" \
    "The Family Plan (2023) {tmdb-1029575} {imdb-tt16431870}/The Family Plan (2023).mkv" \
    "Five Nights at Freddy's (2023) {tmdb-507089} {imdb-tt4589218}/Five Nights at Freddy's (2023).mkv"
    "Tears Of Steel {tvdb-37711} {imdb-tt2285752}/Tears Of Steel.mkv" \
    "Elephant Dream {tvdb-16180} {imdb-tt0807840}/Elephant Dream.mkv" \
    "Big Buck Bunny {tvdb-12352} {imdb-tt1254207}/Big Buck Bunny.mkv"
 )
TVSHOWS=( "Doctor Who (2005) {tvdb-78804} {imdb-tt0436992}/Season 1/S01E01.mkv" \
    "Doctor Who (2005) {tvdb-78804} {imdb-tt0436992}/Season 1/S01E02.mkv" \
    "Doctor Who (2005) {tvdb-78804} {imdb-tt0436992}/Season 1/S01E03.mkv" \
    "Doctor Who (2005) {tvdb-78804} {imdb-tt0436992}/Season 1/S01E04.mkv" \
    "Doctor Who (2005) {tvdb-78804} {imdb-tt0436992}/Season 1/S01E05.mkv" \
    "Doctor Who (2005) {tvdb-78804} {imdb-tt0436992}/Season 1/S01E06.mkv" \
    "Monarch - Legacy of Monsters {tvdb-422598} {imdb-tt17220216}/Season 1/S01E01.mkv" \
    "Monarch - Legacy of Monsters {tvdb-422598} {imdb-tt17220216}/Season 1/S01E02.mkv" \
    "Monarch - Legacy of Monsters {tvdb-422598} {imdb-tt17220216}/Season 1/S01E03.mkv" \
    "Monarch - Legacy of Monsters {tvdb-422598} {imdb-tt17220216}/Season 1/S01E04.mkv" \
    "Monarch - Legacy of Monsters {tvdb-422598} {imdb-tt17220216}/Season 1/S01E05.mkv" \
    "Monarch - Legacy of Monsters {tvdb-422598} {imdb-tt17220216}/Season 1/S01E06.mkv" \
    "ONE PIECE (2023) {tvdb-392276} {imdb-tt11737520}/Season 1/S01E01.mkv" \
    "ONE PIECE (2023) {tvdb-392276} {imdb-tt11737520}/Season 1/S01E02.mkv" \
    "ONE PIECE (2023) {tvdb-392276} {imdb-tt11737520}/Season 1/S01E03.mkv" \
    "My Adventures with Superman {tvdb-403172} {imdb-tt14681924}/Season 1/S01E01.mkv" \
    "My Adventures with Superman {tvdb-403172} {imdb-tt14681924}/Season 1/S01E02.mkv" \
    "My Adventures with Superman {tvdb-403172} {imdb-tt14681924}/Season 1/S01E03.mkv"
    )

COMMAND="ffmpeg -y -t 600 -f lavfi -i color=c=black:s=128x96 -r 1 -c:v libx264 -tune stillimage -pix_fmt yuv420p"


# Create movies and tvshows in movies/$movie and tvshows/$tvshow
for movie in "${MOVIES[@]}"
do
    OUTPUT="movies/$movie"
    echo "Creating movie: $OUTPUT"
    mkdir -p "$(dirname "$OUTPUT")"
    eval "$COMMAND \"$OUTPUT\""
done

for tvshow in "${TVSHOWS[@]}"
do
    OUTPUT="tvshows/$tvshow"
    echo "Creating tvshow: $OUTPUT"
    mkdir -p "$(dirname "$OUTPUT")"
    eval "$COMMAND \"$OUTPUT\""
done
