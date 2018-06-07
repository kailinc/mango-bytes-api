#!/bin/bash
NAME='2 Doc'
DEVCRED=10000
BASEPRICE=100000
DES='You can understand any documentation easily. No matter how horrible the documentation is, you can easily find what you need.'
IMG='https://s3.us-east-2.amazonaws.com/mango-bytes/super-ability/doc-master.png'
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
