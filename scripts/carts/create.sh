#!/bin/bash
NAME='JavaScript'
DEVCRED=100
BASEPRICE=5
IMG='https://s3.us-east-2.amazonaws.com/mango-bytes/languages-frameworks/sass.png'
QUANTITY=2

TOKEN='xasEZ4S9OC984ckxmRqhrmIoFFGXvsd7+nIudJnBUX8=--MGEQT1+t/3H7ABmIlZyFnLpMWaDMKNTxhgVFqP/7H2Y='
API="http://localhost:4741"
URL_PATH="/carts"

curl "${API}${URL_PATH}" \
  --include \
  --request POST \
  --header "Content-Type: application/json" \
  --header "Authorization: Token token=${TOKEN}" \
  --data '{
    "cart": {
      "items": [
        {
          "item_id": "59a197c79f399e9a7f9725b0",
          "name": "'"${NAME}"'",
          "devCred": "'"${DEVCRED}"'",
          "basePrice": "'"${BASEPRICE}"'",
          "attributes": [
            {
              "name": "Python",
              "exp": "2"
            },
            {
              "name": "Html",
              "exp": "2"
            }
          ],
          "img": "'"${IMG}"'",
          "quantity": "'"${QUANTITY}"'"
        },
        {
          "item_id": "59a197c79f399e9a7f9725b1",
          "name": "Python",
          "devCred": "'"${DEVCRED}"'",
          "basePrice": "5",
          "attributes": [
            {g
              "name": "Python",
              "exp": "2"
            },
            {
              "name": "Django",
              "exp": "2"
            }
          ],
          "img": "'"${IMG}"'",
          "quantity": "3"
        }
      ],
      "discount": "10"
    }
  }'

echo
