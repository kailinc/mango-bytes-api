#!/bin/bash
NAME='Monitor'
DEVCRED=2500
BASEPRICE=10099
DES='You feel more like a hacker with more screens: one screen for Spotify, one for your code, one for other peoples code, one for Bitcoin prices, one for documentation, and one for that awesome landing page on Momentum.'
IMG='https://s3.us-east-2.amazonaws.com/mango-bytes/miscellaneous/screen.png'
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
