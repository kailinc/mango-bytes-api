#!/bin/bash
NAME='FireFingers'
DEVCRED=10000
BASEPRICE=100000
DES='You type at the speed on light. Everything that comes to your mind instantly appears on the screen.'
IMG='https://s3.us-east-2.amazonaws.com/mango-bytes/super-ability/9000-wpm.png'
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
