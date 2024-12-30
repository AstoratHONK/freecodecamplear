#! /bin/bash

P="psql -X -U freecodecamp -d salon --tuples-only -c"

MAIN() {
  echo -e "\n|~~~~ Hyper Salon ~~~~|\n|_____________________|\n| select the service  |\n|_____________________|\n"
  LIST_SERVICES=$($P "SELECT * FROM services ORDER BY service_id")
  echo "$LIST_SERVICES" | while read SERVICE_ID BAR NAME
                        do
                        echo "$SERVICE_ID) $NAME"
                        done
  read SERVICE_ID_SELECTED
  SERVICE_ID_SELECTED=$($P "SELECT service_id FROM services WHERE service_id = $SERVICE_ID_SELECTED")
  if ! [[ -z $SERVICE_ID_SELECTED ]]
  then
    echo -e "\nEnter the phone number:"
    read CUSTOMER_PHONE
    PHONE_CHECK=$($P "SELECT phone FROM customers WHERE phone = '$CUSTOMER_PHONE'")
    if [[ -z $PHONE_CHECK ]]
    then
      echo -e "\nUser not found, please enter your name to continue:"
      read CUSTOMER_NAME
      INSERT_NEW_CUST=$($P "INSERT INTO customers(phone, name) VALUES('$CUSTOMER_PHONE', '$CUSTOMER_NAME' )")
      ACTUAL_CUST_ID=$($P "SELECT customer_id FROM customers WHERE phone = '$CUSTOMER_PHONE'")
      CHECK_INSERT_CUST=$($P "SELECT name FROM customers WHERE phone = '$CUSTOMER_PHONE'")
      echo -e "\nRegistration was successful, welcome $CHECK_INSERT_CUST!, What time should I book you in for the service?:\nTime format \"HH:MM\""
      read SERVICE_TIME
      INSERT_TIME=$($P "INSERT INTO appointments(customer_id, service_id, time) VALUES($ACTUAL_CUST_ID, $SERVICE_ID_SELECTED, '$SERVICE_TIME')")
      CHECK_INSERT_CUST=$($P "SELECT name FROM customers WHERE phone = '$CUSTOMER_PHONE'")
      SERVICE_SELECT_NAME=$($P "SELECT name FROM services WHERE service_id = $SERVICE_ID_SELECTED")
      echo -e "\nI have put you down for a$SERVICE_SELECT_NAME at $SERVICE_TIME,$CHECK_INSERT_CUST."
    else
      echo -e "\nRegistration was successful, welcome $CHECK_INSERT_CUST!, What time should I book you in for the service?:\nTime format \"HH:MM\""
      read SERVICE_TIME2
      ACTUAL_CUST_ID2=$($P "SELECT customer_id FROM customers WHERE phone = '$CUSTOMER_PHONE'")
      INSERT_TIME=$($P "INSERT INTO appointments(customer_id, service_id, time) VALUES($ACTUAL_CUST_ID2, $SERVICE_ID_SELECTED, '$SERVICE_TIME2')")
      SERVICE_SELECT_NAME2=$($P "SELECT name FROM services WHERE service_id = $SERVICE_ID_SELECTED")
      NAME_CUST=$($P "SELECT name FROM customers WHERE phone = '$CUSTOMER_PHONE'")
      echo -e "\nI have put you down for a$SERVICE_SELECT_NAME2 at $SERVICE_TIME2,$NAME_CUST."
    fi
  else
    echo "ERROR: The service does not exist or you have entered a non-numeric value"
    echo -e "\nERROR: !!!Enter a numeric value !!!"
    MAIN     
  fi
      
}
  
MAIN
