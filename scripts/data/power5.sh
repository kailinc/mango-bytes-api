#!/bin/bash
NAME='TypNO'
DEVCRED=10000
BASEPRICE=100000
DES='Every word or character you type is correct. Your accuracy is 100%. There will be no comma, semi-colon, brackets, or dots playing hide and seek with you.'
IMG='https://s3.us-east-2.amazonaws.com/mango-bytes/super-ability/precise-typer.png'
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
