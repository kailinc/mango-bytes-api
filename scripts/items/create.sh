#!/bin/bash

NAME='JavaScript'
DES='learn the mysterious power of this mystic power'
IMG='df'
TYPE='EXP'
STOCK=100
DEVCRED=10
BASEPRICE=10
CATEGORY='APPLE, sdfs, sfs, sfds'


API="http://localhost:4741"
URL_PATH="/items"

curl "${API}${URL_PATH}" \
  --include \
  --request POST \
  --header "Content-Type: application/json" \
  --data '{
    "item": {
      "name": "'"${NAME}"'",
      "des": "'"${DES}"'",
      "img": "'"${IMG}"'",
      "type": "'"${TYPE}"'",
      "basePrice": "'"${BASEPRICE}"'",
      "stock": "'"${STOCK}"'",
      "devCred": "'"${DEVCRED}"'",
      "category": "'"${CATEGORY}"'"

    }
  }'

echo
