#!/bin/bash
NAME='Free Life Time Supply of Coffee'
DEVCRED=10000
BASEPRICE=100000
DES='The water you touch becomes any type of coffee you want. This way you can always be focused and full of energy. There is no such thing as caffine overdose or caffine crash.'
IMG='https://s3.us-east-2.amazonaws.com/mango-bytes/super-ability/free-coffee.png'
CAT='superpowers'
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
