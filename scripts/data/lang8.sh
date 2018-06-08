#!/bin/bash
NAME='Html'
DEVCRED=50
BASEPRICE=500
DES='HTML (Hypertext Markup Language) is the set of markup symbols or codes inserted in a file intended for display on a World Wide Web browser page. The markup tells the Web browser how to display a Web page for the user.'
IMG='https://s3.us-east-2.amazonaws.com/mango-bytes/languages-frameworks/html5.png'
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
          "name": "Html",
          "exp": "10"
        }
      ],
      "category": "'"${CAT}"'",
      "des": "'"${DES}"'",
      "img": "'"${IMG}"'"
    }
  }'

echo
