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

  read USERNAME, GAMES_PLAYED, BEST_GAME <<< $($PSQL "SELECT username, games_played, best_game FROM number_guessing WHERE username = '$NAME';")

  if [[ -z $USERNAME ]]; then
    echo -e "\nWelcome, $NAME! It looks like this is your first time here."
  else
    echo -e "\nWelcome back, $USERNAME! You have played $GAMES_PLAYED games, and your best game took $BEST_GAME guesses."
  fi 

  # INSERT_NEW_USER=$($PSQL "INSERT INTO number_guessing(username, games_played) VALUES('$NAME', 1)")
    
   
  echo -e "\nGuess the secret number between 1 and 1000:"
      
      

  while true; do
    read NUMBER_FROM_USER
    if [[ ! $NUMBER_FROM_USER =~ ^[0-9]+$ ]]; then
      echo -e "\nThat is not an integer, guess again:"
      ((GUESS_COUNT++))
      continue
    else
      if (( NUMBER_FROM_USER == random_number )); then
        ((GUESS_COUNT++))
        echo -e "\nYou guessed it in $GUESS_COUNT tries. The secret number was $random_number. Nice job!"
        break
      elif (( NUMBER_FROM_USER < random_number ));then
        ((GUESS_COUNT++))
        echo -e "\nIt's higher than that, guess again:"
        continue
      elif (( NUMBER_FROM_USER > random_number ));then
        ((GUESS_COUNT++))
        echo -e "\nIt's lower than that, guess again:"
        continue
      fi
    fi
  done
}

MAIIN_FUNCTION
