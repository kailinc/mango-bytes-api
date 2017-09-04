#!/bin/bash

NAME='sass'
STOCK=10000
DEVCRED=100
TYPE='skills'
BASEPRICE=5
ATTRIBUTES='sass+2 html+1 css+1'
CATEGORY='sass html css bootStrap'
DES='a scripting language that is interpreted or compiled into Cascading Style Sheets'
IMG='https://s3.us-east-2.amazonaws.com/mango-bytes/languages-frameworks/sass.png'



API="https://damp-hamlet-57878.herokuapp.com/items"

curl "${API}" \
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
      "attributes": "'"${ATTRIBUTES}"'",
      "category": "'"${CATEGORY}"'",
      "des": "'"${DES}"'",
      "img": "'"${IMG}"'"
    }
  }'

echo
