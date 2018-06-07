#!/bin/bash
NAME='Rubber Duck Army'
DEVCRED=500
BASEPRICE=2599
DES='There comes a time where you are too lazy to explain your complicated problem on Stack OverFlow. Your friends do not know how to help you. You found nothing like it on Google, GitHub, or Stack Overflow. You go to the rubber duck and ask for the way because that is totally normal.'
IMG='https://s3.us-east-2.amazonaws.com/mango-bytes/miscellaneous/rubber-duck.png'
CAT='misc'
API="https://damp-hamlet-57878.herokuapp.com/"
URL_PATH="item"

curl "${API}/${URL_PATH}" \
  --include \
  --request POST \
  --header "Content-Type: application/json" \
  --data '{
    "credentials": {
      "name": "'"${NAME}"'",
      "devCred": "'"${DEVCRED}"'",
      "basePrice": "'"${BASEPRICE}"'",
      "attributes": [
      ],
      "category": "'"${CAT}"'",
      "des": "'"${DES}"'",
      "img": "'"${IMG}"'"
    }
  }'

echo
