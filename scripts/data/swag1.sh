#!/bin/bash
NAME='Girl Coder Shirt'
DEVCRED=750
BASEPRICE=1499
DES='Clothing to Represent'
IMG='https://s3.us-east-2.amazonaws.com/mango-bytes/shirts/Screen+Shot+2017-08-18+at+8.24.00+PM.png'
CAT='swag'
API="http://localhost:4741"
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
