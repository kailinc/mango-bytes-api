#!/bin/bash
NAME='Node'
DEVCRED=100
BASEPRICE=200
DES='Node.js is an open-source, cross-platform JavaScript run-time environment that executes JavaScript code server-side. Node.js lets developers use JavaScript for server-side scripting—running scripts server-side to produce dynamic web page content before the page is sent to the user.'
IMG='https://s3.us-east-2.amazonaws.com/mango-bytes/languages-frameworks/node.jpg'
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
        },
        {
          "name": "Node",
          "exp": "5"
        }
      ],
      "category": "'"${CAT}"'",
      "des": "'"${DES}"'",
      "img": "'"${IMG}"'"
    }
  }'

echo
