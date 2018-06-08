#!/bin/bash
NAME='VR Headset'
DEVCRED=2500
BASEPRICE=10000
DES='Why go outside when you can be in an awesome virtual world in the comfort of your room and air condition?'
IMG='https://s3.us-east-2.amazonaws.com/mango-bytes/miscellaneous/vr.png'
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
