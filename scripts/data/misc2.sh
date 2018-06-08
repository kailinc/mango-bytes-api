#!/bin/bash
NAME='DJI Drone'
DEVCRED=5000
BASEPRICE=90000
DES='No reason. Drones are just awesome.'
IMG='https://s3.us-east-2.amazonaws.com/mango-bytes/miscellaneous/dji-spark.png'
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
