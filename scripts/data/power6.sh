#!/bin/bash
NAME='WalkingGoogle'
DEVCRED=10000
BASEPRICE=100000
DES='Everything that is on the Internet is in your head. You do not need to search on Google for answers. You have the answers.'
IMG='https://s3.us-east-2.amazonaws.com/mango-bytes/super-ability/walking-google.png'
CAT='superpowers'
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
