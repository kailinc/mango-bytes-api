#!/bin/bash
NAME='BootStrap'
DEVCRED=100
BASEPRICE=300
DES='Bootstrap is a free and open-source front-end library for designing websites and web applications. It contains HTML- and CSS-based design templates for typography, forms, buttons, navigation and other interface components, as well as optional JavaScript extensions.'
IMG='https://s3.us-east-2.amazonaws.com/mango-bytes/languages-frameworks/bootstrap.png'
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
          "name": "Javascript",
          "exp": "3"
        }, {
          "name": "Css",
          "exp": "3"
        },
        {
          "name": "Html",
          "exp": "3"
        },
        {
          "name": "BootStrap",
          "exp": "5"
        }
      ],
      "category": "'"${CAT}"'",
      "des": "'"${DES}"'",
      "img": "'"${IMG}"'"
    }
  }'

echo
