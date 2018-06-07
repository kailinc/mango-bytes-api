#!/bin/bash
NAME='Go'
DEVCRED=100
BASEPRICE=500
DES='Go is an open-source programming language developed at Google by Robert Griesemer, Rob Pike, and Ken Thompson in 2007. One defining feature of Go is concurrency, which means that multiple processes can be executed at the same time, which makes Go an efficient language.'
IMG='https://s3.us-east-2.amazonaws.com/mango-bytes/languages-frameworks/go.png'
CAT='points'
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
          "name": "Go",
          "exp": "10"
        }
      ],
      "category": "'"${CAT}"'",
      "des": "'"${DES}"'",
      "img": "'"${IMG}"'"
    }
  }'

echo
