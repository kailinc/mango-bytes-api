#!/bin/bash
NAME='Angular'
DEVCRED=100
BASEPRICE=300
DES='Angular is a structural framework for dynamic web apps. It lets you use HTML as your template language and lets you extend HTML syntax to express your components clearly and succinctly'
IMG='https://s3.us-east-2.amazonaws.com/mango-bytes/languages-frameworks/angular.png'
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
          "name": "JavaScript",
          "exp": "3"
        }, {
          "name": "Angular",
          "exp": "5"
        },
        {
          "name": "Html",
          "exp": "3"
        }
      ],
      "category": "'"${CAT}"'",
      "des": "'"${DES}"'",
      "img": "'"${IMG}"'"
    }
  }'

echo
