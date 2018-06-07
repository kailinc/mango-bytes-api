#!/bin/bash
NAME='BootStrap Sticker'
DEVCRED=300
BASEPRICE=50
DES='Sticker for Skills'
IMG='https://s3.us-east-2.amazonaws.com/mango-bytes/stickers/bootstrap.png'
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
        {
          "name": "BootStrap",
          "exp": "2"
        },
        {
          "name": "Html",
          "exp": "1"
        }
      ],
      "category": "'"${CAT}"'",
      "des": "'"${DES}"'",
      "img": "'"${IMG}"'"
    }
  }'

echo
