#!/bin/bash
NAME='JavaScript'
DEVCRED=100
BASEPRICE=5
IMG='https://s3.us-east-2.amazonaws.com/mango-bytes/languages-frameworks/sass.png'
QUANTITY=2

TOKEN='8SlnzYGMSXG+jxrftSNdqJs2rDNPKMqIbbm9p5JQ/t0=--y/HG3DTUY+KeHOoQTD/ZElD0mVhwoabv/7SBSu6wjl4='
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
            {
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
      "discount": "10",
      "isPaid": "true",
      "discount": "10",
      "charge": "123421",
      "attributes": {
        "JavaScript": "10",
        "Python": "20"
      }
    }
  }'

echo
