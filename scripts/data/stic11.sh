#!/bin/bash
NAME='HandleBars Sticker'
DEVCRED=500
BASEPRICE=50
DES='Sticker for Skills'
IMG='https://s3.us-east-2.amazonaws.com/mango-bytes/stickers/handlebars.png'
CAT='stickers'
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
