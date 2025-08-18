#!/bin/bash

MOVIES=("Coolie" "WAR 2" "Marco")

#here coolie is 0, war2 is 1, marco is 3. as array list numbers start from 0 to 9

echo "The first movie is: ${MOVIES[0]}"
echo "The Second movie is: ${MOVIES[1]}"
echo "The Third movie is: ${MOVIES[2]}"

echo "All movies are: ${MOVIES[@]}"