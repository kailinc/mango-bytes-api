#!/bin/bash
NAME='Tesla Model S'
DEVCRED=25000
BASEPRICE=7570000
DES='Elon Musk is AWESOME!'
IMG='https://s3.us-east-2.amazonaws.com/mango-bytes/miscellaneous/tesla.png'
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
