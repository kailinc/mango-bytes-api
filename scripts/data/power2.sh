#!/bin/bash
NAME='PestControlla'
DEVCRED=10000
BASEPRICE=100000
DES='Whenever you see a bug in your code, you know exactly why its there and what caused it. Your codes does not surprise you with silly moves. You are the Pest Controlla.'
IMG='https://s3.us-east-2.amazonaws.com/mango-bytes/super-ability/debugg-king.png'
CAT='superpowers'
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
