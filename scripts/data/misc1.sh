#!/bin/bash
NAME='Apple Watch'
DEVCRED=1000
BASEPRICE=40099
DES='Because telling the time is just not enough. You want to be able to play Pokemon Go, watch your calories, count your daily steps, swipe on Tinder, read emails on your phone. You might even write your own app on the smart watch. This is 2018.'
IMG='https://s3.us-east-2.amazonaws.com/mango-bytes/miscellaneous/apple-watch.png'
CAT='misc'
API="https://damp-hamlet-57878.herokuapp.com"
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
