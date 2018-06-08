#!/bin/bash
NAME='Rails'
DEVCRED=100
BASEPRICE=300
DES='Ruby on Rails is an open source framework for Web development in Ruby, an object-oriented programming (OOP) language similar to Perl and Python.'
IMG='https://s3.us-east-2.amazonaws.com/mango-bytes/languages-frameworks/rails.jpg'
CAT='points'
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
        {
          "name": "Rails",
          "exp": "5"
        },
        {
          "name": "Ruby",
          "exp": "3"
        }
      ],
      "category": "'"${CAT}"'",
      "des": "'"${DES}"'",
      "img": "'"${IMG}"'"
    }
  }'

echo
