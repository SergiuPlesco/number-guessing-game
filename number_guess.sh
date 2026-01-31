#!/bin/bash

PSQL="psql -X --username=freecodecamp --dbname=number_guess -t --no-align -c"

random_number=$(( $RANDOM % 1000 + 1 ))
echo $random_number
# shuffled_num=$(shuf -i 1-1000 -n 1)
# echo $shuffled_num

MAIIN_FUNCTION() {
  GUESS_COUNT=0
  
  echo -e "\nEnter your name:"
  read NAME

  PLAYER_ID=$($PSQL "SELECT player_id FROM players WHERE player_name = '$NAME';")

  if [[ -z $PLAYER_ID ]]; then
    echo -e "\nWelcome, $NAME! It looks like this is your first time here."
    INSERT_NEW_PLAYER=$($PSQL "INSERT INTO players(player_name) VALUES('$NAME');")
    PLAYER_ID=$($PSQL "SELECT player_id FROM players WHERE player_name = '$NAME';")
  else
    GAME=$($PSQL "SELECT p.player_id, p.player_name, COUNT(g.game_id) AS GAMES_PLAYED, MIN(g.guess_count) AS best_game FROM players p JOIN games g USING(player_id) WHERE g.player_id = $PLAYER_ID GROUP BY p.player_id, p.player_name")
    IFS="|" read PLAYER_ID PLAYER_NAME GAMES_PLAYED BEST_GAME <<< "$GAME"
 
    echo -e "\nWelcome back, $PLAYER_NAME! You have played $GAMES_PLAYED games, and your best game took $BEST_GAME guesses."    
  fi 

  echo -e "\nGuess the secret number between 1 and 1000:"
        
  while true; do
    read NUMBER_FROM_USER
    if [[ ! $NUMBER_FROM_USER =~ ^[0-9]+$ ]]; then
      echo -e "\nThat is not an integer, guess again:"   
      continue
    fi
    
     ((GUESS_COUNT++))

      if (( NUMBER_FROM_USER == random_number )); then
        echo -e "\nYou guessed it in $GUESS_COUNT tries. The secret number was $random_number. Nice job!"
        INSERT_GAME_RESULT=$($PSQL "INSERT INTO games(player_id, guess_count) VALUES($PLAYER_ID, $GUESS_COUNT)")
        break
      elif (( NUMBER_FROM_USER < random_number ));then
        echo -e "\nIt's higher than that, guess again:"
      elif (( NUMBER_FROM_USER > random_number ));then
        echo -e "\nIt's lower than that, guess again:"
      fi
    
  done
}

MAIIN_FUNCTION
