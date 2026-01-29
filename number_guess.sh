#!/bin/bash

PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"

random_number=$(( $RANDOM % 1000 + 1 ))
echo $random_number
shuffled_num=$(shuf -i 1-1000 -n 1)
echo $shuffled_num

MAIIN_FUNCTION() {
  echo -e "\nEnter your name"
  read NAME

  USERNAME=$($PSQL "SELECT username FROM number_guessing WHERE username = '$NAME';")

  if [[ -z $USERNAME ]]; then
    echo -e "\nWelcome, $NAME! It looks like this is your first time here."
    
    # INSERT_NEW_USER=$($PSQL "INSERT INTO number_guessing(username, games_played) VALUES('$NAME', 1)")
    
   
      echo -e "\nGuess the secret number between 1 and 1000:"
      
      

      while true; do
        read NUMBER_FROM_USER
        if [[ ! $NUMBER_FROM_USER =~ ^[0-9]+$ ]]; then
          echo -e "\nThat is not an integer, guess again:"
          continue
        else
          if (( NUMBER_FROM_USER == random_number )); then
            echo -e "You guessed the number $random_number"
            break
          else 
            echo -e "Try again:"
            continue
          fi
        fi
      done

      


 

  fi
}

MAIIN_FUNCTION
