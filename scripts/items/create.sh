#!/bin/bash

NAME='111111'
STOCK=10000
DEVCRED=100
TYPE='skills'
BASEPRICE=5
CATEGORY='sass html css bootStrap'
DES='a scripting language that is interpreted or compiled into Cascading Style Sheets'
IMG='https://s3.us-east-2.amazonaws.com/mango-bytes/languages-frameworks/sass.png'



API="http://localhost:4741"
URL_PATH="item"

curl "${API}/${URL_PATH}" \
  --include \
  --request POST \
  --header "Content-Type: application/json" \
  --data '{
    "item": {
      "name": "'"${NAME}"'",
      "stock": "'"${STOCK}"'",
      "devCred": "'"${DEVCRED}"'",
      "type": "'"${TYPE}"'",
      "basePrice": "'"${BASEPRICE}"'",
      "attributes": [
        {
          "name": "Sass",
          "exp": "2"
        },
        {
          "name": "Html",
          "exp": "2"
        }
      ],
      "category": "'"${CATEGORY}"'",
      "des": "'"${DES}"'",
      "img": "'"${IMG}"'"
    }
  }'

echo
