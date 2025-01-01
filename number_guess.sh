#! /bin/bash

P="psql -X -U freecodecamp -d number_guess --tuples-only -c"

NUM=$(( $RANDOM % 999 + 1 ))
C_NUM=0

  echo -e "Enter your username:"
  read USERNAME
  if ! [[ -z $USERNAME ]]
  then
    CHECK_USR=$($P "SELECT user_id FROM users WHERE name = '$USERNAME'")
    if [[ -z $CHECK_USR ]]
    then
      INSERT_USR=$($P "INSERT INTO users(name) VALUES('$USERNAME')")
      CHECK_USR2=$($P "SELECT name FROM users WHERE name = '$USERNAME'")
      echo -e "\nWelcome,$CHECK_USR2! It looks like this is your first time here."
    else
      CHECK_USR3=$($P "SELECT name FROM users WHERE name = '$USERNAME'")
      C_GAME=$($P "SELECT COUNT(*) FROM users INNER JOIN sesion ON users.user_id = sesion.user_id WHERE users.name = '$USERNAME'")
      M_GAME=$($P "SELECT MIN(sesion.pop) FROM users INNER JOIN sesion ON users.user_id = sesion.user_id WHERE users.name = '$USERNAME'")
      C_C_GAME=$(echo $C_GAME | sed -r 's/ //g')
      C_M_GAME=$(echo $M_GAME | sed -r 's/ //g')
      echo -e "\nWelcome back,$CHECK_USR3! You have played $C_C_GAME games, and your best game took $C_M_GAME guesses.\n"
    fi
  fi
  GET_ID=$($P "SELECT user_id FROM users WHERE name = '$USERNAME'")
  INSERT_GAME=$($P "INSERT INTO sesion(user_id) VALUES($GET_ID)")
  GET_ID_GAME=$($P "SELECT sesion_id FROM sesion WHERE user_id = $GET_ID ORDER BY sesion_id DESC LIMIT 1")
  echo -e "\nGuess the secret number between 1 and 1000:"
  read USER_NUM
  echo
  echo $NUM
  echo $GET_ID_GAME
    while true
    do
      if [[ -z $USER_NUM ]] || ! [[ $USER_NUM =~ ^[0-9]+$ ]]; then
      echo "That is not an integer, guess again:"
      read USER_NUM
      continue
      fi

      C_NUM=$(( C_NUM + 1 ))
      if [[ $USER_NUM =~ ^[0-9]*$ ]] && ! [[ -z $USER_NUM ]] && [[ $USER_NUM -eq $NUM ]]
      then
        #INSERT_POP_WIN=$($P "INSERT INTO score(user_id, sesions_id, score) VALUES($GET_ID, $GET_ID_GAME, 1)")
        #NUM_PO=$($P "SELECT COUNT(sesions_id) FROM score WHERE user_id = $GET_ID AND sesions_id = $GET_ID_GAME GROUP BY sesions_id")
        #CLEAR_NUM=$(echo $NUM_PO | sed -r 's/ //g')
        #NUM_MIN=$(( CLEAR_NUM -1 ))
        INSER_POP=$($P "UPDATE sesion SET pop = $C_NUM WHERE sesion_id = $GET_ID_GAME")
       echo "You guessed it in $C_NUM tries. The secret number was $NUM. Nice job!"
       break
      elif [[ $USER_NUM =~ ^[0-9]*$ ]] && ! [[ -z $USER_NUM ]] && [[ $USER_NUM -ge $NUM ]]
      then
        echo "It's higher than that, guess again:"
        read USER_NUM
        #INSERT_POP_WIN=$($P "INSERT INTO score(user_id, sesions_id) VALUES($GET_ID, $GET_ID_GAME)")
       elif [[ $USER_NUM =~ ^[0-9]*$ ]] && ! [[ -z $USER_NUM ]] && [[ $USER_NUM -lt $NUM ]]
       then
        echo "It's lower than that, guess again:"
        read USER_NUM
        #INSERT_POP_WIN=$($P "INSERT INTO score(user_id, sesions_id) VALUES($GET_ID, $GET_ID_GAME)")
      fi
      #echo "You guessed it in <number_of_guesses> tries. The secret number was <secret_number>. Nice job!"

    done

